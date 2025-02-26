const express = require('express');
const fs = require('fs');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const { Console } = require('console');

const app = express();
const PORT = 3000;
const SECRET_KEY = 'supersecretkey';

app.use(express.json());

const usersPath = './src/users.json';

const readUsers = () => {
  const users = JSON.parse(fs.readFileSync(usersPath, 'utf8'));
  return users;
};



// Login de usuario
app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    const users = readUsers();
  
    const user = users.find(user => user.username === username);
    if (!user) return res.status(400).json({ message: 'Credenciales inválidas' });
  
    try {
      const isPasswordValid = await bcrypt.compare(password, user.password);
      console.log('¿Contraseña válida?:', isPasswordValid);
  
      if (!isPasswordValid) return res.status(400).json({ message: 'Credenciales inválidas' });
  
      const token = jwt.sign({ username }, SECRET_KEY, { expiresIn: '1h' });
      res.json({ token });
    } catch (error) {
      console.error('Error al comparar contraseñas:', error);
      res.status(500).json({ message: 'Error interno del servidor' });
    }
});
  
app.get('/profile', (req, res) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) return res.status(401).json({ message: 'Acceso denegado' });

  try {
    const decoded = jwt.verify(token, SECRET_KEY);
    res.json({ message: `Bienvenido ${decoded.username}` });
  } catch (error) {
    res.status(403).json({ message: 'Token inválido' });
  }
});

app.listen(PORT, () => console.log(`Servidor corriendo en http://192.168.20.71:${PORT}`));

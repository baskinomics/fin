import React from 'react';
import Button from 'react-bootstrap/Button'
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Navbar from 'react-bootstrap/Navbar';
import NavbarBrand from 'react-bootstrap/NavbarBrand';

function App() {
  return (
    <Container>
      <Navbar>
        <NavbarBrand href="#">fin</NavbarBrand>
      </Navbar>
      <Container>
        <Button variant="outline-primary">Login</Button>
      </Container>
    </Container>
  );
}

export default App;

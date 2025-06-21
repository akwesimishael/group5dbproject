// 1) Fetch and display items
    fetch('http://localhost:3000/api/items')
      .then(r => r.json())
      .then(items => {
        const ul = document.getElementById('itemList');
        items.forEach(i => {
          let li = document.createElement('li');
          li.textContent = `${i.id}: ${i.name}`;
          ul.appendChild(li);
        });
      });

    // 2) Handle login form
    document.getElementById('loginForm').addEventListener('submit', async e => {
      e.preventDefault();
      const data = {
        username: e.target.username.value,
        password: e.target.password.value
      };
      const res = await fetch('http://localhost:3000/api/validate-user', {
        method: 'POST',
        headers: {'Content-Type': 'application/json'},
        body: JSON.stringify(data)
      });
      const json = await res.json();
      document.getElementById('loginResult').textContent =
        json.valid ? `Welcome, ${json.user.username}!` : 'Invalid credentials';
    });
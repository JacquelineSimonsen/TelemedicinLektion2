<script>
	import { Container, Row, Col, Input, Button } from '@sveltestrap/sveltestrap';

	const md = { size: 4, offset: 4 };
	const sm = { size: 6, offset: 3 };

	let username = '';
	let password = '';

	const login = async () => {
		const response = await fetch('/api/login', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ username, password })
		});
		const result = await response.text();
		if (response.status === 200) {
			window.location = 'http://localhost:5173';
		} else {
			alert('Forkert brugernavn eller password');
		}
	};
</script>

<Container>
	<Row>
		<h1 style="text-align: center;">Login</h1>
	</Row>
	<Row>
		<Col {sm} {md}>
			<Input bind:value={username} type="text" placeholder="Indtast mail" />
		</Col>
	</Row>
	<Row>
		<Col {sm} {md}>
			<Input bind:value={password} type="password" placeholder="Indtast Password" />
		</Col>
	</Row>
	<p> </p>
	<Row>
		<Col {sm} {md} style="text-align: center;">
			<Button color="primary" on:click={login}>Login</Button>
		</Col>
	</Row>
</Container>

<script>
    import { onMount } from 'svelte';
    import { Container, Row, Col, Input, Button } from '@sveltestrap/sveltestrap';

    let user = '';
    let email = '';
    let pass = '';
    let users = [];

    const md = { size: 4, offset: 4 };
	const sm = { size: 6, offset: 3 };

    const fetchUsers = async () => {
        const res = await fetch('api/user');
        users = await res.json();
    };

    const addUser = async () => {
        const res = await fetch('api/user', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                name: user,
                email: email,
                pass: pass
            })
        });
        if (res.status === 409) {
            alert('Brugernavnet er allerede i brug');
        } else if (res.status === 201) {
            alert('Brugeren er oprettet');
            user = email = pass = '';
            fetchUsers();
        } else {
            alert('Der skete en fejl');
        }
    };

    const deleteUser = async (email) => {
        const res = await fetch('api/user', {
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                email: email
            })
        });
        if (res.status === 200) {
            alert('Brugeren er slettet');
            fetchUsers();
        } else {
            alert('Der skete en fejl');
        }
    };


    onMount(fetchUsers);
</script>

<Container>
    <Row>
        <h1 style="text-align: center;">Velkommen til Personale siden af DinDemensTest</h1>
		<p style="text-align: center;"> Opret et login for din patient. <br> Husk af vidergive loginoplysningerne.</p>
    </Row>
    <Row>
        <Col {sm} {md}>
            <Input bind:value={user} placeholder="CPR-nummer" />
        </Col>
    </Row>
    <Row>
        <Col {sm} {md}>
            <Input bind:value={email} placeholder="Email" />
        </Col>
    </Row>
    <Row>
        <Col {sm} {md}>
            <Input bind:value={pass} placeholder="Kodeord" />
        </Col>
    </Row>
	<p> </p>
    <Row>
        <Col {sm} {md} style="text-align: center;">
            <Button color="primary" on:click={addUser}>Opret bruger</Button>
        </Col>
    </Row>
	<p> </p>
    <Row>
        <Col {sm} {md} style="text-align: center;">
            <Button on:click={fetchUsers}>Vis brugere</Button>
        </Col>
    </Row>
    {#each users as user}
        <Row>
            <Col {sm} {md}  style="text-align:center;">
                <div>
                    Brugernavn: {user.name} - Email: {user.email}
                    <Button on:click={() => deleteUser(user.email)}>Slet</Button>
                </div>
            </Col>
        </Row>
    {/each}
    <Row>
        <Col {sm} {md} style="text-align: center;">
            <Button color="primary" on:click={() => window.location.href = 'http://localhost:5173/login'}>
                Gå til login-siden
            </Button>
        </Col>
    </Row>
</Container>

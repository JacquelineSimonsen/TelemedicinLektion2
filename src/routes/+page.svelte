<script>
import {Input, Button} from '@sveltestrap/sveltestrap'
    let input="";
    let json = [];
    const search = async () => {
        const res = await fetch('https://api.dataforsyningen.dk/adgangsadresser?q=' + input);
        json = await res.json();
    }
</script>
<h1>Telemedicin F24</h1>
<Input bind:value={input} type="text" placeholder="Søg efter en adresse" />
<Button color="primary" on:click={search}>Søg</Button>
<div>
{input}
</div>
<h3>Fundne Adresser</h3>
<ul>
{#each json as address}
<li>
    {address.adressebetegnelse}
</li>    
{/each}
</ul>

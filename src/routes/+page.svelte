<script>
    import {Input, Button, Container} from '@sveltestrap/sveltestrap'
    let inputs = Array(15).fill(""); //Her gemmes inputne
    let sum = 0;
    let email = '';

    const md = { size: 4, offset: 4 };
	const sm = { size: 6, offset: 3 };

    const updateSum = () => {    // Summen opdateres
        sum = inputs.reduce((acc, val) => acc + parseInt(val || 0), 0);
    }

    const handleInput = (index, event) => { // Talene lægges sammen
        inputs[index] = event.target.value;
        updateSum();
    }

</script>

<h1 style="text-align: center;">Velkommen til DinDemenstest</h1>
<p> <br> </p>
<h3 style="text-align: center;">Vejledning til besvarelse af spørgsmål: </h3>
<p style="text-align: center;" >Få hjælp til at besvare disse spørgsmål. Hjælperen læser spørgsmålene højt, og noterer ét point for hvert korrekt svar, hvis ikke andet er angivet. <br>Personen der skal svare på spørgsmålene skal IKKE selv læse spørgsmålene eller indtaste point.</p>
<p> <br> </p>
<h4> Testen begynder her:</h4>
<p> </p>
<p {sm} {md} >1. Hvilken årstid har vi? <Input type="number" bind:value={inputs[0]} on:input={(e) => handleInput(0, e)} /></p>
<p>2. Hvilket årstal har vi? <Input type="number" bind:value={inputs[1]} on:input={(e) => handleInput(1, e)} /></p>
<p>3. Hvilken dato har vi? <Input type="number" bind:value={inputs[2]} on:input={(e) => handleInput(2, e)} /></p>
<p>4. Hvilken ugedag har vi? <Input type="number" bind:value={inputs[3]} on:input={(e) => handleInput(3, e)} /></p>
<p>5. Hvilket land befinder vi os i? <Input type="number" bind:value={inputs[4]} on:input={(e) => handleInput(4, e)} /></p>
<p>6. Hvilken by befinder vi os i? <Input type="number" bind:value={inputs[5]} on:input={(e) => handleInput(5, e)} /></p>
<p>7. Hvad er din adresse? <Input type="number" bind:value={inputs[6]} on:input={(e) => handleInput(6, e)} /></p>
<p>8. Hvilket årstal er du født i? <Input type="number" bind:value={inputs[7]} on:input={(e) => handleInput(7, e)} /></p>
<p>9. Nævn 3 genstande: f.eks. æble, bord og mønt. 1 sekund til at sige hver af dem.<br> Spørg så patienten efter alle 3, efter at man har sagt dem. <br> Giv 1 point for hvert korrekt svar. <Input type="number" bind:value={inputs[8]} on:input={(e) => handleInput(8, e)} /></p>
<p>10. Stav ordet SKOLE bagfra. <Input type="number" bind:value={inputs[9]} on:input={(e) => handleInput(9, e)} /></p>
<p>11. Følg en ordre på 3 trin: “Tag papiret i højre hånd, fold det på midten og læg det på gulvet”. <br> Hvis korrekt udført gives 2 point. <Input type="number" bind:value={inputs[10]} on:input={(e) => handleInput(10, e)} /></p>
<p>12. Spørg efter de 3 genstande, som blev gentaget før. Giv 1 point for hvert korrekt svar. <Input type="number" bind:value={inputs[11]} on:input={(e) => handleInput(11, e)} /></p>
<p>13. Hvad er klokken? - se på et ur <Input type="number" bind:value={inputs[12]} on:input={(e) => handleInput(12, e)} /></p>
<p>14. Brug en blyant til at skrive sætningen "JEG ER GLAD" på et stykke papir<Input type="number" bind:value={inputs[13]} on:input={(e) => handleInput(13, e)} /></p>
<p>15. Tegn er cirkel, en firkant og en trekant på et stykke papir<Input type="number" bind:value={inputs[14]} on:input={(e) => handleInput(14, e)} /></p>

<div>
    <p style="text-align: center;"> <b>Din score er: {sum}</b></p>
</div>

<div style="text-align: center;">
    {#if sum >= 18 && sum <= 20}
        <p>Godt klaret! Du er frisk og behøver ikke at kontakte din læge</p>
    {:else if sum >= 14 && sum <= 17}
        <p>Du opfordres til at kontakte din læge</p>
    {:else if sum >= 0 && sum <= 13}
        <p>Kontakt læge</p>
    {:else}
        <p>Noget gik galt, prøv igen</p>
    {/if} 
</div>


<template>
  <div>
    <h1>Multiplication Table Generator</h1>
    <button @click="downloadPdf">Download Multiplication Table PDF</button>
  </div>
</template>

<script>
export default {
  methods: {
    downloadPdf() {
      window.open('/pdf_generator/multiplication_table');
    }
  }
}
</script>

<style scoped>
h1 {
  color: #ff6347;
  font-family: 'Comic Sans MS', sans-serif;
}
button {
  background-color: #f0e68c;
  border: none;
  padding: 10px 20px;
  font-size: 16px;
  cursor: pointer;
}
</style>
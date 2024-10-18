<template>
  <div>
    <h1>Multiplication Practice</h1>
    <div v-for="(pair, index) in equations" :key="index" class="equation-row">
      <span>{{ pair[0] }} x {{ pair[1] }} = </span>
      <input v-model="userAnswers[index]" type="number" class="answer-input" />
      <span v-if="showResults">
        <span v-if="isCorrect(pair[0], pair[1], userAnswers[index])" class="correct">Correct!</span>
        <span v-else class="incorrect">Incorrect (Answer: {{ pair[0] * pair[1] }})</span>
      </span>
    </div>
    <button @click="checkAnswers">Check Answers</button>
  </div>
</template>
<script>
export default {
  data() {
    return {
      equations: [],
      userAnswers: [],
      showResults: false,
    };
  },
  methods: {
    fetchEquations() {
      fetch('/pdf_generator/multiplication_game.json')
        .then(response => response.json())
        .then(data => {
          this.equations = data;
          this.userAnswers = new Array(this.equations.length).fill(null); // Initialize answers array
        });
    },
    isCorrect(i, j, userAnswer) {
      return userAnswer == (i * j);
    },
    checkAnswers() {
      this.showResults = true;
    }
  },
  mounted() {
    this.fetchEquations();
  }
}
</script>
<style scoped>
.equation-row {
  margin: 10px 0;
}
.correct {
  color: green;
  margin-left: 10px;
}
.incorrect {
  color: red;
  margin-left: 10px;
}
.answer-input {
  width: 50px;
}
</style>
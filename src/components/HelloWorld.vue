<template>
  <div class="container">
    <h1>Post</h1>
    <hr />
    <div class="form-todo form-group">
      <p>
        <input
          placeholder="nome"
          type="text"
          name="name"
          class="form-control"
          v-model="name"
        />
      </p>
      <p>
        <input
          placeholder="category"
          type="text"
          name="category"
          class="form-control"
          v-model="category"
        />
      </p>
      <p>
        <textarea
          placeholder="Comentário"
          name="message"
          class="form-control"
          v-model="message"
        ></textarea>
      </p>
      <button
        v-on:click="addComment"
        type="submit"
        class="btn btn-primary"
        name="sub"
      >
        Comentar
      </button>
    </div>
    <div class="list-group">
      <div
        class="list-group-item"
        v-for="(comment, index) in allComments"
        :key="index"
      >
        <span class="comment__author"
          >name: <strong>{{ comment.name }}</strong></span
        >
        <span class="comment__author"
          >category: <strong>{{ comment.category }}</strong></span
        >
        <p>{{ comment.message }}</p>
        <div>
          <a
            href="#"
            title="Excluir"
            v-on:click.prevent="removeComment(index)"
            class="btn btn-danger"
            name="del-link"
            >Excluir</a
          >
        </div>
      </div>
    </div>
    <hr />
  </div>
</template>

<script>
export default {
  name: "HelloWorld",
  data() {
    return {
      comments: [],
      name: "",
      category: "",
      message: "",
    };
  },
  methods: {
    addComment() {
      if (this.message.trim() === "") {
        return;
      }

      this.comments.push({
        name: this.name,
        category: this.category,
        message: this.message,
      });

      this.name = "";
      this.category = "";
      this.message = "";
    },
    removeComment(index) {
      this.comments.splice(index, 1);
    },
  },
  computed: {
    allComments() {
      return this.comments.map((comment) => ({
        ...comment,
        name: comment.name.trim() === "" ? "Anônimo" : comment.name,
      }));
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>

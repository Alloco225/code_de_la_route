<!-- Please remove this file from your project -->
<template>
  <div class="relative bg-gray-700 h-full flex justify-center">
    <section class="relative text-2xl font-semibold mx-auto h-full w-full">
      <nav class="absolute p-3 flex gap-2 justify-center top-0 left-0 w-full">
        <span v-for="(post, k) in posts" :key="k" 
        :class="['bg-gray-400', 'block rounded-full w-24 h-2']">
        <!-- Read progress usually average read time * number of words -->
          
          <span @click="showAt(k)" v-show="currentPostIndex >= k || post.is_read" 
            class="transition-all duration-200 ease-out block rounded-full bg-white h-2"
            :style="'width:'+(post.is_read ? 100 : progressValue)+'%;'"
            >
          </span>
        </span>
        
      </nav>

      <!-- Next prev overlay invisible buttons -->
      <ul class="absolute top-5 md:top-0 left-0 h-full w-full grid grid-cols-5">
        <li @click="showPrev" class="col-span-2 cursor-pointer h-full bg-opacity-0 bg-green-400"></li>
        <li @click="togglePlay" class="cursor-pointer h-full bg-opacity-0 bg-red-400"></li>
        <li @click="showNext" class="col-span-2 cursor-pointer h-full bg-opacity-0 bg-blue-400"></li>
      </ul>
      <!-- Main post cards -->
      <div @keydow.left="showPrev" @keydown.right="showNext" :class="['bg-'+(posts[currentPostIndex]?.color ?? 'gray')+'-600', 'border-'+(posts[currentPostIndex]?.color ?? 'gray')+'-700', 'h-full transition-all duration-300 ease-out']">
        <template
        v-for="(post, k) in posts" 
        
        >
          <article v-show="currentPostIndex == k" :key="k" :class="['bg-'+post.color+'-600', 'border-'+post.color+'-700', ' text-white border  h-full w-full rounded  p-5 flex flex-col gap-3 items-center justify-center']">

            <p v-for="(country_key, s) in Object.keys(post.content)" :key="s" class="flex gap-2 justify-center">
              {{country_emojis[country_key]}} : {{post.content[country_key]}}
            </p>
            
          </article>
        
        </template>
      </div>

      <!-- Social actions -->
      <footer class="absolute bottom-8 md:bottom-0 left-0 w-full flex flex-col gap-3">
        <transition name="fade">
          <section v-show="isPlayToggleSignVisible" class="fixed top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 flex justify-center items-center">
            <!-- Pause/Play button -->
            <span @click="togglePlay" class=" text-white p-5 rounded-full flex justify-center items-center bg-white bg-opacity-20">
              <ion-icon :name="isPlaying ? 'play-outline' : 'pause-outline'" size="large"></ion-icon>
            </span>
          </section>
        </transition>
        <!-- Social actions -->
        <ul v-if="appActions" class="w-full flex justify-center items-center gap-3 pb-5">
          <li @click="executeAction(actionBtn.action)" v-for="(actionBtn, k) in appActions" :key="k" :title="actionBtn.title" class="hover:bg-opacity-40 rounded-full bg-white bg-opacity-20 cursor-pointer flex justify-center items-center p-2 text-white">
            <ion-icon :name="actionBtn.icon" :size="actionBtn?.is_large ? 'large' :'small'"></ion-icon>
          </li>
        </ul>
      </footer>
    </section>

    <!-- New post modal -->
    <transition name="fade-up">
      <section v-show="isCreateFormVisible" class="fixed top-0 left-0 w-full h-full bg-black bg-opacity-25 p-10">
        <form @submit.prevent="submitPost" class="relative flex gap-2 flex-col justify-between bg-white w-full h-full rounded p-3">
          <div class="flex justify-end mb-2">
            <!-- Close button -->
            <span @click="closeCreateForm" class=" rounded-full p-1 flex justify-center items-center bg-black text-red-500  bg-opacity-20 hover:bg-opacity-40">
              <ion-icon name="close-outline" size="large"></ion-icon>
            </span>
          </div>
          <!-- <h3></h3> -->

          <!-- Card -->
          <article class="rounded transition-all duration-300 ease-out h-full w-full shadow text-white flex flex-col gap-3 justify-center items-center"
            :class="['bg-'+selectedColor+'-600']"
          >
          <!-- Empty post -->
            <div v-if="Object.keys(newPost?.content ?? {}).length == 0">
              Choisissez un emoji:
            </div>
          <!-- Post -->
            <div v-else class="flex flex-col gap-2 items-center">
              <div v-for="(country_key, s) in Object.keys(newPost?.content ?? {})" :key="s" class="flex gap-2 justify-start items-center">
                <span>
                  {{country_emojis[country_key]}} :
                </span>
                <div>
                  <input v-if="selectedCountry == country_key" :id="'input_'+country_key" type="text" v-model="newPostSentence" @keydown.enter="saveCountrySentence" autofocus="autofocus" class="border-0 rounded p-1 px-2 focus:ring-0 outline-none" :class="['bg-'+selectedColor+'-700']" value="">
                  <span v-else @click="selectCountry(country_key)">
                    <span>
                      {{newPost?.content[country_key] ?? ''}}
                    </span>
                  </span>
                </div>
              </div>
            </div>
          </article>
          <div class="flex items-center gap-3">
            <!-- Color choice -->
            <div class="flex">
              <span @click="switchColor" class="border cursor-pointer flex justify-center items-center rounded-full p-1 bg-opacity-70" :class="['bg-'+selectedColor+'-600']">
                <span :class="['bg-'+selectedColor+'-600', 'block rounded-full w-7 h-7']"></span>
              </span>
            </div>

            <!-- Country choice -->
            <div class="flex w-full items-center gap-3 text-xl">
              <div class="flex gap-3 bg-gray-100 pl-2 pt-1 w-full overflow-x-scroll rounded">
                <span v-for="(country_key, c) in Object.keys(country_emojis)" :key="c" @click="selectCountry(country_key)" class="cursor-pointer bg-gray-200 rounded px-2 flex justify-center items-center">
                  {{country_emojis[country_key]}}
                </span>
              </div>
              <span class="cursor-pointer p-1 flex justify-center items-center rounded-full bg-black bg-opacity-25">
                <ion-icon name="add-outline"></ion-icon>
              </span>
            </div>

            
          </div>

          <!-- Submit -->
          <button type="submit" class="rounded mt-3 shadow-lg font-semibold text-white text-lg hover:bg-green-800 bg-green-500 w-full px-3 py-2">
            Poster
          </button>
        </form>
      </section>
    </transition>
  </div>
</template>

<script>
export default {
  components: {},
  inject: ["ss", "ui", "appRoutes"],
  data() {
    return {
      averageReadingSpeedInWordPerSec: 1, // 3words/sec 150 words per minute 
      appActions: [
        {
          title: 'Précédent',
          action: 'prev',
          icon: 'chevron-back-outline',
        },
        {
          title: 'Sauvegarder',
          action: 'bookmark',
          icon: 'bookmark-outline',
        },
        {
          title: 'Créer',
          action: 'create',
          icon: 'add-outline',
          is_large: true,
        },
        {
          title: 'Partager',
          action: 'share',
          icon: 'arrow-redo-outline',
        },
        {
          title: 'Suivant',
          action: 'next',
          icon: 'chevron-forward-outline',
        },
      ],
      colors: ['gray', 'blue', 'pink', 'yellow', 'red', 'black', 'green'],
      country_emojis: {
        fr: '🇫🇷',
        ci: '🇨🇮',
        ao: '🇦🇴',

      },
      currentPostIndex: -1,
      currentViewTimeInSec: 0,
      intervalRefreshTimeInMillisec: 100, // 300miliseconds
      isCreateFormVisible: false,
      isPlaying: true,
      isPlayToggleSignVisible: false,
      newPost: {
        content: {},
      },
      newPostSentence: null,
      posts: [],
      progressInterval: null,

      progressValue: 0,
      selectedColorIndex: 0,

      selectedCountry: null,
      selectedInputElm: null,
      
    };
  },

  created() {},
  mounted() {
    console.log("** HomePage **");
    this._initApp();
    // this.openCreateForm();
    
    document.addEventListener( "keydown", this.onKeydown );
  
  },
  computed: {
    currentPostTotalViewTime(){
      const content = this.posts[this.currentPostIndex]?.content
          let wordCount = 0;
          Object.keys(content).forEach(key => {
            wordCount += content[key].split(' ').length;
          });
          // 
          return wordCount * this.averageReadingSpeedInWordPerSec;
    },
    currentContext(){
      if(this.isCreateFormVisible) return 'form';
      return 'main';
    },
    keyIndexer(){
      return {
        // TODO add form context
        main: {
          Escape: () => this.pause(),
          Space: () => this.togglePlay(),
          ArrowLeft: () => this.showPrev(),
          ArrowRight: () => this.showNext(),
        },

      }
    },
    selectedColor(){
      return this.colors[this.selectedColorIndex];
    },

  },
  methods: {
    async _initApp() {
      

      await this.fetchPosts();

      // this.posts = [
      //   {
      //     color: 'gray',
      //     content: {
      //       fr: "Tu me manques",
      //       ci: "Ma maman te salue",
      //     },
      //     font: null,
      //     is_read: false,
      //   },
      //   {
      //     color: 'blue',
      //     content: {
      //       fr: "Ouvre la porte",
      //       ci: "Ouporta",
      //     },
      //     font: null,
      //     is_read: false,
      //   },
      //   {
      //     color: 'green',
      //     content: {
      //       fr: "Bellingram est trop fort",
      //       ci: "Bellingram est trop chanceux",
      //     },
      //     font: null,
      //     is_read: false,
      //   },
      // ]

      this.showNext();
      // map emoji content
    },
    clearCreateForm(){
      this.newPost = {
        content: {}, color: null,
      };
    },
    closeCreateForm(){
      this.isCreateFormVisible = false;
      this.play();
    },
    computeViewTime(){
      this.progressValue = 0;
      this.currentViewTimeInSec = 0;
      // return;
      clearInterval(this.progressInterval);

      this.progressInterval = setInterval(() => {
        // Only compute if is playing
        if(this.isPlaying){
          this.currentViewTimeInSec += (this.intervalRefreshTimeInMillisec/1000)
          this.progressValue = (this.currentViewTimeInSec * 100 )/ this.currentPostTotalViewTime;
        }

      }, this.intervalRefreshTimeInMillisec);
    },
    executeAction(action){
      // 
      const actionIndexer = {
        bookmark: (action)=>{
          // 
        },
        create: (action)=>{
          // 
          this.openCreateForm();
        },
        prev: (action)=>{
          this.showPrev();
        },
        next: (action)=>{
          this.showNext();
        },
        share: (action)=>{
          // 
        },
      }
      // 
      try {
        actionIndexer[action]();
        
      } catch (error) {
        console.error("xx executeAction", error);
      }
    },
    async fetchPosts(){
        // Assuming you have exported the Firestore db instance in your firebase.js plugin
      try {
        console.log("fetchPosts");
        console.log("fire", this.$fire);
        // Fetch posts from the "posts" collection
        // const postsSnapshot = await this.$fire.firestore.collection('posts').get();

        // // Map the documents into an array
        // this.posts = postsSnapshot.docs.map(doc => {
        //   console.log("doc", doc);
        //   return {
        //     id: doc.id,
        //     ...doc.data(),
        //   };
        // });

        this.posts = postsSnapshot.docs.map(doc => {
          console.log("doc", doc);
          return {
            id: doc.id,
            ...doc.data(),
          };
        });
        console.log("posts", this.posts);
      } catch (error) {
        console.error('Error fetching posts:', error);
      }

      return { posts: this.posts };
    },
    markPostRead(){

      let post = this.posts[this.currentPostIndex]
      if(post){
        post.is_read = true;
        this.posts[this.currentPostIndex] = post;
      }
    },
    markPostUnRead(){

      let post = this.posts[this.currentPostIndex]
      if(post){
        post.is_read = false;
        this.posts[this.currentPostIndex] = post;
      }
    },
    markAllPostsUnRead(){

      const updated = this.posts.map(p => ({...p, is_read: false}))
      this.posts = updated;
    },
    onKeydown( event ) {
      const key = event.code;
      if(Object.keys(this.keyIndexer[this.currentContext]).includes(key)){
        console.log("keydown", event, "k", event.code);
        this.keyIndexer[this.currentContext][key]()
      }
    },
    openCreateForm(){
      this.isCreateFormVisible = true;
      this.pause();
    },
    play(){
      this.isPlaying = true;
    },
    pause(){
      this.isPlaying = false;
    },
    resume(){
      this.isPlaying = true;
    },
    saveCountrySentence(){
      if(!!this.selectedCountry && !!this.newPostSentence){
        this.newPost.content[this.selectedCountry] = this.newPostSentence;
        this.unselectCountry();
      }
    },

    selectCountry(country_key){
      this.saveCountrySentence();
      
      
      // 
      const value = this.newPost?.content[country_key] ?? null;
      console.log("selectCountry", country_key, "v", value, !!value);
      if(!!value){
        this.newPostSentence = this.newPost.content[country_key] ?? null;
      }else{
        let data = {...this.newPost};
        data.content[country_key] = '';
        this.newPost = data;
        this.newPostSentence = '';
        console.log("new keys", this.newPost.content);
      }
      
      this.selectedCountry = country_key;
      // TODO focus
      setTimeout(() => {
        const inputId = 'input_'+country_key
        this.selectedInputElm = document.getElementById(inputId);
        this.selectedInputElm.focus();
      }, 1000);

    },
    showAt(index){
      this.currentPostIndex = index;
      this.computeViewTime();
    },
    showNext(){
      this.markPostRead();

      if(this.currentPostIndex >= this.posts.length-1){
        this.currentPostIndex = 0;
        // mark everyone unread
        this.markAllPostsUnRead();
      }else{
        this.currentPostIndex++;
      }
      this.computeViewTime();
    },
    showPrev(){
      this.markPostUnRead();
      if(this.currentPostIndex < 1){
      }else{
        this.currentPostIndex--;
      }
      this.computeViewTime();
    },
    async submitPost(){
      this.saveCountrySentence();
      // 
      this.newPost.color = this.selectedColor;

      const postSnapshot = await this.$fire.firestore.collection('posts').add(this.newPost);

      this.newPost.id = postSnapshot.id;
      this.posts.push(this.newPost);

      this.clearCreateForm();
      this.closeCreateForm();
    },
    switchColor(){
      this.selectedColorIndex = Math.floor(Math.random()*this.colors.length)
      
    },
    togglePlay(){
      this.isPlayToggleSignVisible = true;
      this.isPlaying = !this.isPlaying;

      setTimeout(() => {
        this.isPlayToggleSignVisible = false;
      }, 3000);

    },
    unselectCountry(){
      this.selectedCountry = null;
      this.newPostSentence = null;
    }
  },
  watch: {
    progressValue: function(val){
      if(val >= 100){
        this.showNext();
      }
    }
  }
};
</script>

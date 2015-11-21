   var GuideSentence = 'メールアドレスを入力';
   function ShowFormGuide(obj) {
      // 入力案内を表示
      if( obj.value == '' ) {
         obj.value = GuideSentence;
         obj.style.color = '#808080';
      }
   }
   function HideFormGuide(obj) {
      // 入力案内を消す
      if( obj.value == GuideSentence ) {
         obj.value='';
         obj.style.color = '#000000';
      }
   }



   var GuideSentence2 = 'パスワードを入力';
   function ShowFormGuide2(obj) {
      // 入力案内を表示
      if( obj.value == '' ) {
         obj.value = GuideSentence2;
         obj.style.color = '#808080';
      }
   }
   function HideFormGuide2(obj) {
      // 入力案内を消す
      if( obj.value == GuideSentence2 ) {
         obj.value='';
         obj.style.color = '#000000';
      }
   }













/*


<script type="text/javascript">
   var GuideSentence = 'メールアドレスを入力';
   function ShowFormGuide(obj) {
      // 入力案内を表示
      if( obj.value == '' ) {
         obj.value = GuideSentence;
         obj.style.color = '#808080';
      }
   }
   function HideFormGuide(obj) {
      // 入力案内を消す
      if( obj.value == GuideSentence ) {
         obj.value='';
         obj.style.color = '#000000';
      }
   }



   var GuideSentence2 = 'パスワードを入力';
   function ShowFormGuide2(obj) {
      // 入力案内を表示
      if( obj.value == '' ) {
         obj.value = GuideSentence2;
         obj.style.color = '#808080';
      }
   }
   function HideFormGuide2(obj) {
      // 入力案内を消す
      if( obj.value == GuideSentence2 ) {
         obj.value='';
         obj.style.color = '#000000';
      }
   }

</script>


*/
---
title: Tạo kiểu cho thành phần Vue với CSS
slug: Learn_web_development/Core/Frameworks_libraries/Vue_styling
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_methods_events_models","Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties", "Learn_web_development/Core/Frameworks_libraries")}}

Cuối cùng đã đến lúc làm cho ứng dụng của chúng ta trông đẹp hơn một chút. Trong bài viết này, chúng ta sẽ khám phá các cách khác nhau để tạo kiểu cho các thành phần Vue với CSS.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Quen thuộc với các ngôn ngữ cốt lõi <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a> và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>,
          kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/dòng lệnh</a
          >.
        </p>
        <p>
          Các thành phần Vue được viết như một sự kết hợp của các đối tượng JavaScript quản lý dữ liệu của ứng dụng và cú pháp mẫu dựa trên HTML ánh xạ tới cấu trúc DOM bên dưới. Để cài đặt và sử dụng một số tính năng nâng cao hơn của Vue (như Single File Components hoặc render functions), bạn sẽ cần một terminal có node + npm được cài đặt.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>Tìm hiểu về tạo kiểu cho các thành phần Vue.</td>
    </tr>
  </tbody>
</table>

## Tạo kiểu cho thành phần Vue với CSS

Trước khi chúng ta tiến tới thêm các tính năng nâng cao hơn vào ứng dụng, chúng ta nên thêm một số CSS cơ bản để làm cho nó trông đẹp hơn. Vue có ba cách tiếp cận phổ biến để tạo kiểu cho ứng dụng:

- Các file CSS bên ngoài.
- Các kiểu toàn cục trong Single File Components (file `.vue`).
- Các kiểu có phạm vi thành phần trong Single File Components.

Để giúp bạn làm quen với từng cách, chúng ta sẽ sử dụng kết hợp cả ba để tạo cho ứng dụng giao diện và cảm giác đẹp hơn.

## Tạo kiểu với các file CSS bên ngoài

Bạn có thể đưa vào các file CSS bên ngoài và áp dụng chúng toàn cầu cho ứng dụng. Hãy xem cách thực hiện điều này.

Để bắt đầu, tạo một file có tên `reset.css` trong thư mục `src/assets`. Các file trong thư mục này được xử lý bởi webpack. Điều này có nghĩa là chúng ta có thể sử dụng các bộ tiền xử lý CSS (như SCSS) hoặc các bộ hậu xử lý (như PostCSS).

Mặc dù bài hướng dẫn này sẽ không sử dụng các công cụ như vậy, nhưng tốt là biết rằng khi đưa code như vậy vào thư mục assets, nó sẽ được xử lý tự động.

Thêm nội dung sau vào file `reset.css`:

```css
/* reset.css */
/* RESETS */
*,
*::before,
*::after {
  box-sizing: border-box;
}
*:focus {
  outline: 3px dashed #228bec;
}
html {
  font: 62.5% / 1.15 sans-serif;
}
h1,
h2 {
  margin-bottom: 0;
}
ul {
  list-style: none;
  padding: 0;
}
button {
  border: none;
  margin: 0;
  padding: 0;
  width: auto;
  overflow: visible;
  background: transparent;
  color: inherit;
  font: inherit;
  line-height: normal;
  -webkit-font-smoothing: inherit;
  -moz-osx-font-smoothing: inherit;
  appearance: none;
}
button::-moz-focus-inner {
  border: 0;
}
button,
input,
optgroup,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
}
button,
input {
  /* 1 */
  overflow: visible;
}
input[type="text"] {
  border-radius: 0;
}
body {
  width: 100%;
  max-width: 68rem;
  margin: 0 auto;
  font:
    1.6rem/1.25 "Helvetica Neue",
    "Helvetica",
    "Arial",
    sans-serif;
  background-color: whitesmoke;
  color: #4d4d4d;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
}
@media screen and (width >= 620px) {
  body {
    font-size: 1.9rem;
    line-height: 1.31579;
  }
}
/* END RESETS */
```

Tiếp theo, trong file `src/main.js` của bạn, import file `reset.css` như sau:

```js
import "./assets/reset.css";
```

Điều này sẽ khiến file được nhận trong bước build và tự động thêm vào trang web của chúng ta.

Các kiểu reset bây giờ sẽ được áp dụng cho ứng dụng. Các hình ảnh bên dưới cho thấy giao diện ứng dụng trước và sau khi reset được áp dụng.

Trước:

![ứng dụng todo với kiểu một phần được thêm vào; ứng dụng bây giờ ở trong một thẻ card, nhưng một số tính năng nội bộ vẫn cần tạo kiểu](todo-app-unstyled.png)

Sau:

![ứng dụng todo với kiểu một phần được thêm vào; ứng dụng bây giờ ở trong một thẻ card, nhưng một số tính năng nội bộ vẫn cần tạo kiểu](todo-app-reset-styles.png)

Những thay đổi đáng chú ý bao gồm việc xóa các dấu đầu dòng danh sách, thay đổi màu nền và thay đổi kiểu nút và input cơ bản.

## Thêm kiểu toàn cục vào Single File Components

Bây giờ chúng ta đã reset CSS để thống nhất giữa các trình duyệt, chúng ta cần tùy chỉnh các kiểu thêm một chút. Có một số kiểu mà chúng ta muốn áp dụng trên các thành phần trong ứng dụng. Mặc dù thêm các file này trực tiếp vào stylesheet `reset.css` sẽ hoạt động, nhưng thay vào đó chúng ta sẽ thêm chúng vào các thẻ `<style>` trong `App.vue` để minh họa cách sử dụng.

Đã có một số kiểu hiện diện trong file. Hãy xóa những cái đó và thay thế bằng các kiểu bên dưới. Những kiểu này làm một vài điều — thêm một số kiểu cho các nút và input, và tùy chỉnh phần tử `#app` và các thành phần con của nó.

Cập nhật phần tử `<style>` của file `App.vue` để trông như sau:

```vue
<style>
/* Global styles */
.btn {
  padding: 0.8rem 1rem 0.7rem;
  border: 0.2rem solid #4d4d4d;
  cursor: pointer;
  text-transform: capitalize;
}
.btn__danger {
  color: white;
  background-color: #ca3c3c;
  border-color: #bd2130;
}
.btn__filter {
  border-color: lightgrey;
}
.btn__danger:focus {
  outline-color: #c82333;
}
.btn__primary {
  color: white;
  background-color: black;
}
.btn-group {
  display: flex;
  justify-content: space-between;
}
.btn-group > * {
  flex: 1 1 auto;
}
.btn-group > * + * {
  margin-left: 0.8rem;
}
.label-wrapper {
  margin: 0;
  flex: 0 0 100%;
  text-align: center;
}
[class*="__lg"] {
  display: inline-block;
  width: 100%;
  font-size: 1.9rem;
}
[class*="__lg"]:not(:last-child) {
  margin-bottom: 1rem;
}
@media screen and (width >= 620px) {
  [class*="__lg"] {
    font-size: 2.4rem;
  }
}
.visually-hidden {
  position: absolute;
  height: 1px;
  width: 1px;
  overflow: hidden;
  clip: rect(1px, 1px, 1px, 1px);
  clip-path: rect(1px 1px 1px 1px);
  white-space: nowrap;
}
[class*="stack"] > * {
  margin-top: 0;
  margin-bottom: 0;
}
.stack-small > * + * {
  margin-top: 1.25rem;
}
.stack-large > * + * {
  margin-top: 2.5rem;
}
@media screen and (width >= 550px) {
  .stack-small > * + * {
    margin-top: 1.4rem;
  }
  .stack-large > * + * {
    margin-top: 2.8rem;
  }
}
/* End global styles */
#app {
  background: white;
  margin: 2rem 0 4rem 0;
  padding: 1rem;
  padding-top: 0;
  position: relative;
  box-shadow:
    0 2px 4px 0 rgb(0 0 0 / 20%),
    0 2.5rem 5rem 0 rgb(0 0 0 / 10%);
}
@media screen and (width >= 550px) {
  #app {
    padding: 4rem;
  }
}
#app > * {
  max-width: 50rem;
  margin-left: auto;
  margin-right: auto;
}
#app > form {
  max-width: 100%;
}
#app h1 {
  display: block;
  min-width: 100%;
  width: 100%;
  text-align: center;
  margin: 0;
  margin-bottom: 1rem;
}
</style>
```

Nếu bạn kiểm tra ứng dụng, bạn sẽ thấy rằng danh sách todo của chúng ta bây giờ nằm trong một thẻ card, và chúng ta có một số định dạng tốt hơn cho các mục todo. Bây giờ chúng ta có thể đi qua và bắt đầu chỉnh sửa các thành phần để sử dụng một số kiểu này.

![ứng dụng todo với kiểu một phần được thêm vào; ứng dụng bây giờ ở trong một thẻ card, nhưng một số tính năng nội bộ vẫn cần tạo kiểu](todo-app-partial-styles.png)

### Thêm các lớp CSS trong Vue

Chúng ta nên áp dụng các lớp CSS nút cho `<button>` trong thành phần `ToDoForm`. Vì các mẫu Vue là HTML hợp lệ, điều này được thực hiện theo cách tương tự như bạn có thể làm trong HTML thuần — bằng cách thêm thuộc tính `class=""` vào phần tử.

Thêm `class="btn btn__primary btn__lg"` vào phần tử `<button>` của biểu mẫu:

```vue
<button type="submit" class="btn btn__primary btn__lg">Add</button>
```

Trong khi chúng ta đang ở đây, có thêm một thay đổi ngữ nghĩa và tạo kiểu chúng ta có thể thực hiện. Vì biểu mẫu của chúng ta biểu thị một phần cụ thể của trang, nó có thể được hưởng lợi từ phần tử `<h2>`. Tuy nhiên nhãn đã biểu thị mục đích của biểu mẫu. Để tránh lặp lại bản thân, hãy bao bọc nhãn trong một `<h2>`. Cũng có một số kiểu CSS toàn cục khác mà chúng ta có thể thêm. Chúng ta cũng sẽ thêm lớp `input__lg` vào phần tử `<input>`.

Cập nhật mẫu `ToDoForm` để trông như thế này:

```vue
<template>
  <form @submit.prevent="onSubmit">
    <h2 class="label-wrapper">
      <label for="new-todo-input" class="label__lg">
        What needs to be done?
      </label>
    </h2>
    <input
      type="text"
      id="new-todo-input"
      name="new-todo"
      autocomplete="off"
      v-model.lazy.trim="label"
      class="input__lg" />
    <button type="submit" class="btn btn__primary btn__lg">Add</button>
  </form>
</template>
```

Hãy cũng thêm lớp `stack-large` vào thẻ `<ul>` trong file `App.vue`. Điều này sẽ giúp cải thiện khoảng cách của các mục todo một chút.

Cập nhật nó như sau:

```vue
<ul aria-labelledby="list-summary" class="stack-large">
  …
</ul>
```

## Thêm các kiểu có phạm vi

Thành phần cuối cùng chúng ta muốn tạo kiểu là thành phần `ToDoItem`. Để giữ các định nghĩa kiểu gần với thành phần, chúng ta có thể thêm phần tử `<style>` bên trong nó. Tuy nhiên, nếu các kiểu này thay đổi những thứ bên ngoài thành phần này, có thể khó theo dõi các kiểu chịu trách nhiệm và khắc phục vấn đề. Đây là lúc thuộc tính `scoped` có thể hữu ích — điều này gắn một bộ chọn thuộc tính `data` HTML duy nhất vào tất cả các kiểu của bạn, ngăn chúng va chạm toàn cầu.

Để sử dụng bộ điều chỉnh `scoped`, tạo phần tử `<style>` bên trong `ToDoItem.vue`, ở cuối file, và cung cấp cho nó thuộc tính `scoped`:

```vue
<style scoped>
/* … */
</style>
```

Tiếp theo, sao chép CSS sau vào phần tử `<style>` mới được tạo:

```css
.custom-checkbox > .checkbox-label {
  font-family: "Arial", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-weight: normal;
  font-size: 1rem;
  line-height: 1.25;
  color: #0b0c0c;
  display: block;
  margin-bottom: 5px;
}
.custom-checkbox > .checkbox {
  font-family: "Arial", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  font-weight: normal;
  font-size: 1rem;
  line-height: 1.25;
  box-sizing: border-box;
  width: 100%;
  height: 2.5rem;
  margin-top: 0;
  padding: 5px;
  border: 2px solid #0b0c0c;
  border-radius: 0;
  appearance: none;
}
.custom-checkbox > input:focus {
  outline: 3px dashed #ffdd00;
  outline-offset: 0;
  box-shadow: inset 0 0 0 2px;
}
.custom-checkbox {
  font-family: "Arial", sans-serif;
  -webkit-font-smoothing: antialiased;
  font-weight: normal;
  font-size: 1.6rem;
  line-height: 1.25;
  display: block;
  position: relative;
  min-height: 40px;
  margin-bottom: 10px;
  padding-left: 40px;
  clear: left;
}
.custom-checkbox > input[type="checkbox"] {
  -webkit-font-smoothing: antialiased;
  cursor: pointer;
  position: absolute;
  z-index: 1;
  top: -2px;
  left: -2px;
  width: 44px;
  height: 44px;
  margin: 0;
  opacity: 0;
}
.custom-checkbox > .checkbox-label {
  font-size: inherit;
  font-family: inherit;
  line-height: inherit;
  display: inline-block;
  margin-bottom: 0;
  padding: 8px 15px 5px;
  cursor: pointer;
  touch-action: manipulation;
}
.custom-checkbox > label::before {
  content: "";
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  width: 40px;
  height: 40px;
  border: 2px solid currentColor;
  background: transparent;
}
.custom-checkbox > input[type="checkbox"]:focus + label::before {
  border-width: 4px;
  outline: 3px dashed #228bec;
}
.custom-checkbox > label::after {
  box-sizing: content-box;
  content: "";
  position: absolute;
  top: 11px;
  left: 9px;
  width: 18px;
  height: 7px;
  transform: rotate(-45deg);
  border: solid;
  border-width: 0 0 5px 5px;
  border-top-color: transparent;
  opacity: 0;
  background: transparent;
}
.custom-checkbox > input[type="checkbox"]:checked + label::after {
  opacity: 1;
}
@media only screen and (width >= 40rem) {
  label,
  input,
  .custom-checkbox {
    font-size: 1.9rem;
    line-height: 1.31579;
  }
}
```

Bây giờ chúng ta cần thêm một số lớp CSS vào mẫu của mình để kết nối các kiểu.

Vào `<div>` gốc, thêm lớp `custom-checkbox`. Vào `<input>`, thêm lớp `checkbox`. Cuối cùng, vào `<label>` thêm lớp `checkbox-label`. Mẫu được cập nhật ở bên dưới:

```vue
<template>
  <div class="custom-checkbox">
    <input type="checkbox" :id="id" :checked="isDone" class="checkbox" />
    <label :for="id" class="checkbox-label">\{{ label }}</label>
  </div>
</template>
```

Ứng dụng bây giờ nên có các checkbox tùy chỉnh. Ứng dụng của bạn sẽ trông giống như ảnh chụp màn hình bên dưới.

![ứng dụng todo với kiểu hoàn chỉnh. Biểu mẫu input bây giờ được tạo kiểu đúng cách, và các mục todo bây giờ có khoảng cách và checkbox tùy chỉnh](todo-app-complete-styles.png)

## Tóm tắt

Công việc tạo kiểu mẫu ứng dụng của chúng ta đã hoàn thành. Trong bài viết tiếp theo, chúng ta sẽ trở lại thêm một số chức năng nữa vào ứng dụng, cụ thể là sử dụng thuộc tính tính toán để thêm số lượng các mục todo đã hoàn thành vào ứng dụng.

{{PreviousMenuNext("Learn_web_development/Core/Frameworks_libraries/Vue_methods_events_models","Learn_web_development/Core/Frameworks_libraries/Vue_computed_properties", "Learn_web_development/Core/Frameworks_libraries")}}

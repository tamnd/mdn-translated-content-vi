---
title: Cách triển khai API dựa trên Promise
short-title: Triển khai API dựa trên Promise
slug: Learn_web_development/Extensions/Async_JS/Implementing_a_promise-based_API
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Promises", "Learn_web_development/Extensions/Async_JS/Introducing_workers", "Learn_web_development/Extensions/Async_JS")}}

Trong bài viết trước, chúng ta đã thảo luận về cách sử dụng các API trả về Promise. Trong bài viết này, chúng ta sẽ xem xét phía bên kia — cách _triển khai_ các API trả về Promise. Đây là nhiệm vụ ít phổ biến hơn nhiều so với việc sử dụng các API dựa trên Promise, nhưng vẫn đáng để biết.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
         Hiểu biết vững chắc về <a href="/en-US/docs/Learn_web_development/Core/Scripting">các kiến thức cơ bản về JavaScript</a> và các khái niệm bất đồng bộ, được đề cập trong các bài học trước trong mô-đun này.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>Hiểu cách triển khai các API dựa trên Promise.</td>
    </tr>
  </tbody>
</table>

Nói chung, khi bạn triển khai API dựa trên Promise, bạn sẽ bọc một thao tác bất đồng bộ, có thể sử dụng sự kiện, hàm gọi lại thuần túy, hoặc mô hình truyền thông điệp. Bạn sẽ sắp xếp để đối tượng `Promise` xử lý sự thành công hoặc thất bại của thao tác đó một cách thích hợp.

## Triển khai API alarm()

Trong ví dụ này, chúng ta sẽ triển khai API báo thức dựa trên Promise, được gọi là `alarm()`. Nó sẽ nhận các đối số là tên người cần đánh thức và thời gian chờ tính bằng mili giây trước khi đánh thức người đó. Sau khi hết thời gian chờ, hàm sẽ gửi một thông báo "Wake up!", bao gồm tên người chúng ta cần đánh thức.

### Bọc setTimeout()

Chúng ta sẽ sử dụng API {{domxref("Window.setTimeout", "setTimeout()")}} để triển khai hàm `alarm()`. API `setTimeout()` nhận các đối số là một hàm gọi lại và thời gian chờ tính bằng mili giây. Khi `setTimeout()` được gọi, nó khởi động bộ đếm thời gian được đặt thành thời gian chờ đã cho, và khi thời gian hết, nó gọi hàm đã cho.

Trong ví dụ bên dưới, chúng ta gọi `setTimeout()` với hàm gọi lại và thời gian chờ 1000 mili giây:

```html
<button id="set-alarm">Set alarm</button>
<div id="output"></div>
```

```css hidden
div {
  margin: 0.5rem 0;
}
```

```js
const output = document.querySelector("#output");
const button = document.querySelector("#set-alarm");

function setAlarm() {
  setTimeout(() => {
    output.textContent = "Wake up!";
  }, 1000);
}

button.addEventListener("click", setAlarm);
```

{{EmbedLiveSample("Wrapping setTimeout()", 600, 100)}}

### Hàm khởi tạo Promise()

Hàm `alarm()` của chúng ta sẽ trả về một `Promise` được hoàn thành khi bộ đếm thời gian hết. Nó sẽ truyền thông báo "Wake up!" vào trình xử lý `then()`, và sẽ từ chối Promise nếu người gọi cung cấp giá trị thời gian chờ âm.

Thành phần chính ở đây là hàm khởi tạo {{jsxref("Promise/Promise", "Promise()")}}. Hàm khởi tạo `Promise()` nhận một hàm duy nhất làm đối số. Chúng ta sẽ gọi hàm này là `executor`. Khi bạn tạo một Promise mới, bạn cung cấp cách triển khai của executor.

Chính hàm executor này nhận hai đối số, cả hai cũng là hàm, và theo quy ước được gọi là `resolve` và `reject`. Trong cách triển khai executor của bạn, bạn gọi hàm bất đồng bộ cơ bản. Nếu hàm bất đồng bộ thành công, bạn gọi `resolve`, và nếu thất bại, bạn gọi `reject`. Nếu hàm executor ném ra lỗi, `reject` sẽ được gọi tự động. Bạn có thể truyền một tham số duy nhất của bất kỳ loại nào vào `resolve` và `reject`.

Vì vậy chúng ta có thể triển khai `alarm()` như sau:

```js
function alarm(person, delay) {
  return new Promise((resolve, reject) => {
    if (delay < 0) {
      reject(new Error("Alarm delay must not be negative"));
      return;
    }
    setTimeout(() => {
      resolve(`Wake up, ${person}!`);
    }, delay);
  });
}
```

Hàm này tạo và trả về một `Promise` mới. Bên trong executor cho Promise, chúng ta:

- kiểm tra xem `delay` có âm không, và gọi `reject`, truyền vào lỗi tùy chỉnh nếu có.

- gọi `setTimeout()`, truyền hàm gọi lại và `delay`. Hàm gọi lại sẽ được gọi khi bộ đếm thời gian hết, và trong hàm gọi lại chúng ta gọi `resolve`, truyền vào thông báo `"Wake up!"`.

## Sử dụng API alarm()

Phần này khá quen thuộc từ bài viết trước. Chúng ta có thể gọi `alarm()`, và trên Promise được trả về gọi `then()` và `catch()` để đặt các trình xử lý cho việc hoàn thành và từ chối Promise.

```html hidden
<div>
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" size="4" value="Matilda" />
</div>

<div>
  <label for="delay">Delay:</label>
  <input type="text" id="delay" name="delay" size="4" value="1000" />
</div>

<button id="set-alarm">Set alarm</button>
<div id="output"></div>
```

```css hidden
button {
  display: block;
}

div,
button {
  margin: 0.5rem 0;
}
```

```js
const name = document.querySelector("#name");
const delay = document.querySelector("#delay");
const button = document.querySelector("#set-alarm");
const output = document.querySelector("#output");

function alarm(person, delay) {
  return new Promise((resolve, reject) => {
    if (delay < 0) {
      reject(new Error("Alarm delay must not be negative"));
      return;
    }
    setTimeout(() => {
      resolve(`Wake up, ${person}!`);
    }, delay);
  });
}

button.addEventListener("click", () => {
  alarm(name.value, delay.value)
    .then((message) => (output.textContent = message))
    .catch((error) => (output.textContent = `Couldn't set alarm: ${error}`));
});
```

{{EmbedLiveSample("Using the alarm() API", 600, 160)}}

Hãy thử đặt các giá trị khác nhau cho "Name" và "Delay". Hãy thử đặt giá trị âm cho "Delay".

## Sử dụng async và await với API alarm()

Vì `alarm()` trả về một `Promise`, chúng ta có thể làm mọi thứ với nó mà chúng ta có thể làm với bất kỳ Promise nào khác: xâu chuỗi Promise, `Promise.all()`, và `async` / `await`:

```html hidden
<div>
  <label for="name">Name:</label>
  <input type="text" id="name" name="name" size="4" value="Matilda" />
</div>

<div>
  <label for="delay">Delay:</label>
  <input type="text" id="delay" name="delay" size="4" value="1000" />
</div>

<button id="set-alarm">Set alarm</button>
<div id="output"></div>
```

```css hidden
button {
  display: block;
}

div,
button {
  margin: 0.5rem 0;
}
```

```js
const name = document.querySelector("#name");
const delay = document.querySelector("#delay");
const button = document.querySelector("#set-alarm");
const output = document.querySelector("#output");

function alarm(person, delay) {
  return new Promise((resolve, reject) => {
    if (delay < 0) {
      reject(new Error("Alarm delay must not be negative"));
      return;
    }
    setTimeout(() => {
      resolve(`Wake up, ${person}!`);
    }, delay);
  });
}

button.addEventListener("click", async () => {
  try {
    const message = await alarm(name.value, delay.value);
    output.textContent = message;
  } catch (error) {
    output.textContent = `Couldn't set alarm: ${error}`;
  }
});
```

{{EmbedLiveSample("Using async and await with the alarm() API", 600, 160)}}

## Xem thêm

- [Hàm khởi tạo `Promise()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/Promise)
- [Sử dụng Promise](/en-US/docs/Web/JavaScript/Guide/Using_promises)

{{PreviousMenuNext("Learn_web_development/Extensions/Async_JS/Promises", "Learn_web_development/Extensions/Async_JS/Introducing_workers", "Learn_web_development/Extensions/Async_JS")}}

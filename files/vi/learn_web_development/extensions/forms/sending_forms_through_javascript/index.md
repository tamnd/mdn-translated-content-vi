---
title: Gửi biểu mẫu qua JavaScript
short-title: JS form submission
slug: Learn_web_development/Extensions/Forms/Sending_forms_through_JavaScript
page-type: learn-module-chapter
sidebar: learnsidebar
---

Khi người dùng gửi một biểu mẫu HTML, chẳng hạn bằng cách nhấn vào {{glossary("Submit_button", "nút gửi")}}, trình duyệt sẽ thực hiện một yêu cầu [HTTP](/en-US/docs/Web/HTTP) để gửi dữ liệu trong biểu mẫu. Nhưng thay vì cách tiếp cận khai báo này, các ứng dụng web đôi khi sử dụng các API JavaScript như {{domxref("Window/fetch", "fetch()")}} để gửi dữ liệu theo cách lập trình đến một điểm cuối mong đợi một lần gửi biểu mẫu. Bài viết này giải thích lý do tại sao đây là một trường hợp sử dụng quan trọng và cách thực hiện.

## Tại sao nên sử dụng JavaScript để gửi dữ liệu biểu mẫu?

Gửi biểu mẫu HTML tiêu chuẩn, như được mô tả trong bài viết của chúng tôi về [gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data), sẽ tải URL nơi dữ liệu được gửi đến, có nghĩa là cửa sổ trình duyệt điều hướng với một lần tải trang đầy đủ.

Tuy nhiên, nhiều ứng dụng web, đặc biệt là {{glossary("progressive web apps")}} và {{glossary("SPA", "ứng dụng một trang")}}, sử dụng các API JavaScript để yêu cầu dữ liệu từ máy chủ và cập nhật các phần liên quan của trang, tránh chi phí của một lần tải trang đầy đủ.

Vì lý do này, khi các ứng dụng web này muốn gửi dữ liệu biểu mẫu, chúng chỉ sử dụng biểu mẫu HTML để thu thập đầu vào từ người dùng, nhưng không dùng cho việc gửi dữ liệu. Khi người dùng cố gắng gửi dữ liệu, ứng dụng sẽ kiểm soát và gửi dữ liệu bằng cách sử dụng API JavaScript như {{domxref("Window/fetch", "fetch()")}}.

## Vấn đề với việc gửi biểu mẫu qua JavaScript

Nếu điểm cuối máy chủ mà ứng dụng web gửi dữ liệu biểu mẫu đến nằm dưới sự kiểm soát của nhà phát triển ứng dụng web, thì họ có thể gửi dữ liệu biểu mẫu theo bất kỳ cách nào họ chọn: ví dụ, dưới dạng đối tượng JSON.

Tuy nhiên, nếu điểm cuối máy chủ đang mong đợi một lần gửi biểu mẫu, ứng dụng web phải mã hóa dữ liệu theo một cách cụ thể. Ví dụ, nếu dữ liệu chỉ là văn bản, nó được tạo thành từ các danh sách cặp khóa/giá trị được mã hóa URL và được gửi với {{httpheader("Content-Type")}} là `application/x-www-form-urlencoded`. Nếu biểu mẫu bao gồm dữ liệu nhị phân, nó phải được gửi bằng cách sử dụng kiểu nội dung `multipart/form-data`.

Giao diện {{domxref("FormData")}} đảm nhận quá trình mã hóa dữ liệu theo cách này, và trong phần còn lại của bài viết này, chúng tôi sẽ cung cấp phần giới thiệu nhanh về `FormData`. Để biết thêm chi tiết, hãy xem hướng dẫn của chúng tôi về [Sử dụng đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects).

## Xây dựng đối tượng `FormData` thủ công

Bạn có thể điền dữ liệu vào một đối tượng `FormData` bằng cách gọi phương thức {{domxref("FormData.append()", "append()")}} của đối tượng cho mỗi trường bạn muốn thêm, truyền vào tên và giá trị của trường. Giá trị có thể là một chuỗi, đối với các trường văn bản, hoặc một {{domxref("Blob")}}, đối với các trường nhị phân, bao gồm các đối tượng {{domxref("File")}}.

Trong ví dụ sau, chúng tôi gửi dữ liệu dưới dạng một lần gửi biểu mẫu khi người dùng nhấp vào nút:

```js
async function sendData(data) {
  // Construct a FormData instance
  const formData = new FormData();

  // Add a text field
  formData.append("name", "Pomegranate");

  // Add a file
  const selection = await window.showOpenFilePicker();
  if (selection.length > 0) {
    const file = await selection[0].getFile();
    formData.append("file", file);
  }

  try {
    const response = await fetch("https://example.org/post", {
      method: "POST",
      // Set the FormData instance as the request body
      body: formData,
    });
    console.log(await response.json());
  } catch (e) {
    console.error(e);
  }
}

const send = document.querySelector("#send");
send.addEventListener("click", sendData);
```

1. Đầu tiên, chúng ta xây dựng một đối tượng `FormData` mới, rỗng.

2. Tiếp theo, chúng ta gọi `append()` hai lần, để thêm hai mục vào đối tượng `FormData`: một trường văn bản và một tệp.

3. Cuối cùng, chúng ta thực hiện một yêu cầu {{httpmethod("POST")}} bằng cách sử dụng API `fetch()`, đặt đối tượng `FormData` làm nội dung yêu cầu.

Lưu ý rằng chúng ta không phải đặt tiêu đề {{httpheader("Content-Type")}}: tiêu đề chính xác sẽ được đặt tự động khi chúng ta truyền một đối tượng `FormData` vào `fetch()`.

## Liên kết đối tượng `FormData` với `<form>`

Nếu dữ liệu bạn đang gửi thực sự đến từ một {{htmlelement("form")}}, bạn có thể điền vào phiên bản `FormData` bằng cách truyền biểu mẫu vào hàm tạo `FormData`.

Giả sử HTML của chúng ta khai báo một phần tử `<form>`:

```html
<form id="userinfo">
  <p>
    <label for="username">Enter your name:</label>
    <input type="text" id="username" name="username" value="Dominic" />
  </p>
  <p>
    <label for="avatar">Select an avatar</label>
    <input type="file" id="avatar" name="avatar" required />
  </p>
  <input type="submit" value="Submit" />
</form>
```

Biểu mẫu bao gồm một đầu vào văn bản, một đầu vào tệp và một nút gửi.

JavaScript như sau:

```js
const form = document.querySelector("#userinfo");

async function sendData() {
  // Associate the FormData object with the form element
  const formData = new FormData(form);

  try {
    const response = await fetch("https://example.org/post", {
      method: "POST",
      // Set the FormData instance as the request body
      body: formData,
    });
    console.log(await response.json());
  } catch (e) {
    console.error(e);
  }
}

// Take over form submission
form.addEventListener("submit", (event) => {
  event.preventDefault();
  sendData();
});
```

Chúng ta thêm một trình xử lý sự kiện gửi cho phần tử biểu mẫu. Điều này đầu tiên gọi {{domxref("Event.preventDefault()", "preventDefault()")}} để ngăn chặn việc gửi biểu mẫu tích hợp sẵn của trình duyệt, để chúng ta có thể kiểm soát. Sau đó chúng ta gọi `sendData()`, lấy phần tử biểu mẫu và truyền nó vào hàm tạo `FormData`.

Sau đó, chúng ta gửi phiên bản `FormData` như một yêu cầu HTTP `POST`, bằng cách sử dụng `fetch()`.

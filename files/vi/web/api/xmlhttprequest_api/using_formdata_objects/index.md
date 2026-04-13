---
title: Using FormData Objects
slug: Web/API/XMLHttpRequest_API/Using_FormData_Objects
page-type: guide
---

{{DefaultAPISidebar("XMLHttpRequest API")}}

Đối tượng [`FormData`](/en-US/docs/Web/API/FormData) cho phép bạn gom một tập các cặp key/value để gửi bằng [Fetch](/en-US/docs/Web/API/Fetch_API) hoặc [XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API). Nó chủ yếu được dùng để gửi dữ liệu biểu mẫu, nhưng cũng có thể được dùng độc lập với form để truyền dữ liệu theo khóa. Dữ liệu được truyền theo đúng định dạng mà phương thức {{domxref("HTMLFormElement.submit","submit()")}} của form sẽ dùng nếu kiểu mã hóa của form được đặt là `multipart/form-data`.

## Tạo đối tượng `FormData` từ đầu

Bạn có thể tự xây dựng một đối tượng `FormData`, khởi tạo nó rồi thêm các trường bằng cách gọi phương thức {{domxref("FormData.append","append()")}} của nó, như sau:

```js
const send = document.querySelector("#send");

send.addEventListener("click", async () => {
  const formData = new FormData();
  formData.append("username", "Groucho");
  formData.append("accountNum", 123456);

  // Một phần tử <input> kiểu file
  const avatar = document.querySelector("#avatar");
  formData.append("avatar", avatar.files[0]);

  // Đối tượng giống tệp của JavaScript
  const content = '<q id="a"><span id="b">hey!</span></q>';
  const blob = new Blob([content], { type: "text/xml" });
  formData.append("webmasterFile", blob);

  const response = await fetch("http://example.org/post", {
    method: "POST",
    body: formData,
  });
  console.log(await response.json());
});
```

> [!NOTE]
> Các trường `"avatar"` và `"webmasterFile"` đều chứa một tệp. Số được gán cho trường `"accountNum"` sẽ được chuyển ngay thành chuỗi bởi phương thức [`FormData.append()`](/en-US/docs/Web/API/FormData/append) (giá trị của trường có thể là một {{ domxref("Blob") }}, {{ domxref("File") }}, hoặc chuỗi. Nếu giá trị không phải `Blob` cũng không phải `File`, nó sẽ được chuyển thành chuỗi).

Ví dụ này tạo một thể hiện `FormData` chứa các giá trị cho các trường có tên `"username"`, `"accountNum"`, `"avatar"` và `"webmasterFile"`, rồi dùng {{domxref("Window/fetch", "fetch()")}} để gửi dữ liệu của form. Trường `"webmasterFile"` là một {{domxref("Blob")}}. Đối tượng `Blob` biểu diễn một đối tượng giống tệp với dữ liệu thô, bất biến. Blob đại diện cho dữ liệu không nhất thiết ở định dạng gốc JavaScript. Giao diện {{ domxref("File") }} dựa trên `Blob`, kế thừa các khả năng của blob và mở rộng để hỗ trợ các tệp trên hệ thống của người dùng. Để tạo một `Blob`, bạn có thể gọi [constructor `Blob()`](/en-US/docs/Web/API/Blob/Blob).

## Lấy đối tượng `FormData` từ một form HTML

Để tạo một đối tượng `FormData` chứa dữ liệu từ một {{ HTMLElement("form") }} hiện có, hãy chỉ định phần tử form đó khi tạo đối tượng `FormData`:

> [!NOTE]
> `FormData` chỉ sử dụng các trường input có thuộc tính `name`.

```js
const formData = new FormData(someFormElement);
```

Ví dụ:

```js
const send = document.querySelector("#send");

send.addEventListener("click", async () => {
  // Một phần tử <form>
  const userInfo = document.querySelector("#user-info");
  const formData = new FormData(userInfo);

  const response = await fetch("http://example.org/post", {
    method: "POST",
    body: formData,
  });
  console.log(await response.json());
});
```

Bạn cũng có thể thêm dữ liệu bổ sung vào đối tượng `FormData` giữa lúc lấy nó từ form và lúc gửi đi, như sau:

```js
const send = document.querySelector("#send");

send.addEventListener("click", async () => {
  const userInfo = document.querySelector("#user-info");
  const formData = new FormData(userInfo);
  formData.append("serialnumber", 12345);

  const response = await fetch("http://example.org/post", {
    method: "POST",
    body: formData,
  });
  console.log(await response.json());
});
```

Điều này cho phép bạn bổ sung dữ liệu cho form trước khi gửi, để thêm các thông tin không nhất thiết do người dùng chỉnh sửa.

## Gửi tệp bằng đối tượng `FormData`

Bạn cũng có thể gửi tệp bằng `FormData`. Hãy đưa một phần tử {{ HTMLElement("input") }} kiểu `file` vào {{htmlelement("form")}} của bạn:

```html
<form enctype="multipart/form-data" method="post" name="fileinfo" id="fileinfo">
  <p>
    <label
      >Your email address:
      <input
        type="email"
        autocomplete="on"
        name="userid"
        placeholder="email"
        required
        size="32"
        maxlength="64" />
    </label>
  </p>
  <p>
    <label
      >Custom file label:
      <input type="text" name="file-label" size="12" maxlength="32" />
    </label>
  </p>
  <p>
    <label
      >File to stash:
      <input type="file" name="file" required />
    </label>
  </p>
  <p>
    <input type="submit" value="Stash the file!" />
  </p>
</form>
```

Sau đó bạn có thể gửi nó bằng đoạn mã như sau:

```js
const form = document.querySelector("#fileinfo");

form.addEventListener("submit", async (event) => {
  const formData = new FormData(form);

  formData.append("CustomField", "This is some extra data");

  const response = await fetch("stash.php", {
    method: "POST",
    body: formData,
  });
  event.preventDefault();
});
```

> [!NOTE]
> Nếu bạn truyền vào một tham chiếu đến form, phương thức HTTP của yêu cầu được chỉ định trong form sẽ được dùng thay cho phương thức được chỉ định trong lời gọi `open()`.

> [!WARNING]
> Khi dùng `FormData` để gửi các yêu cầu POST bằng {{ domxref("XMLHttpRequest") }} hoặc [Fetch API](/en-US/docs/Web/API/Fetch_API) với kiểu nội dung `multipart/form-data` (ví dụ khi tải tệp và blob lên máy chủ), _đừng_ đặt thủ công header [`Content-Type`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) trên yêu cầu. Làm vậy sẽ ngăn trình duyệt tự đặt header `Content-Type` với biểu thức boundary mà nó dùng để phân tách các trường biểu mẫu trong thân yêu cầu.

Bạn cũng có thể thêm trực tiếp một {{ domxref("File") }} hoặc {{ domxref("Blob") }} vào đối tượng {{ domxref("FormData") }}, như sau:

```js
data.append("myfile", myBlob, "filename.txt");
```

Khi dùng phương thức {{domxref("FormData.append","append()")}} có thể sử dụng tham số tùy chọn thứ ba để truyền tên tệp trong header `Content-Disposition` được gửi đến máy chủ. Khi không chỉ định tên tệp (hoặc tham số không được hỗ trợ), tên `"blob"` sẽ được dùng.

## Dùng sự kiện `formdata`

Sự kiện [`formdata`](/en-US/docs/Web/API/HTMLFormElement/formdata_event), mới hơn đối tượng {{domxref("FormData")}}, được kích hoạt trên đối tượng {{domxref("HTMLFormElement")}} sau khi danh sách mục nhập đại diện cho dữ liệu của form được tạo. Điều này xảy ra khi form được gửi, nhưng cũng có thể được kích hoạt bằng cách gọi constructor {{domxref("FormData.FormData", "FormData()")}}.

Điều này cho phép lấy nhanh một đối tượng {{domxref("FormData")}} khi sự kiện `formdata` được bắn ra, thay vì phải tự ghép nó lại.

Ví dụ, trong JavaScript ta có thể tham chiếu một form:

```js
const formElem = document.querySelector("form");
```

Trong handler của sự kiện [`submit`](/en-US/docs/Web/API/HTMLFormElement/submit_event), chúng ta dùng [`preventDefault`](/en-US/docs/Web/API/Event/preventDefault) để chặn việc gửi form mặc định, rồi gọi constructor {{domxref("FormData.FormData", "FormData()")}} để kích hoạt sự kiện `formdata`:

```js
formElem.addEventListener("submit", (e) => {
  // khi gửi form, chặn mặc định
  e.preventDefault();

  // tạo đối tượng FormData, điều này kích hoạt sự kiện formdata
  new FormData(formElem);
});
```

Khi sự kiện `formdata` được kích hoạt, ta có thể truy cập đối tượng {{domxref("FormData")}} bằng {{domxref("FormDataEvent.formData")}}, rồi làm bất cứ điều gì mình muốn với nó (bên dưới chúng ta gửi nó lên máy chủ bằng {{domxref("XMLHttpRequest")}}).

```js
formElem.addEventListener("formdata", (e) => {
  console.log("formdata fired");

  // Lấy dữ liệu form từ đối tượng sự kiện
  const data = e.formData;
  for (const value of data.values()) {
    console.log(value);
  }

  // Gửi dữ liệu qua fetch()
  fetch("/formHandler", {
    method: "POST",
    body: data,
  });
});
```

## Lưu ý

Đối tượng `FormData` không bao gồm dữ liệu từ các trường bị vô hiệu hóa hoặc các fieldset bị vô hiệu hóa.

## Xem thêm

- [Using the Fetch API](/en-US/docs/Web/API/Fetch_API/Using_Fetch)
- {{domxref("HTMLFormElement")}}
- {{domxref("Blob")}}
- [Typed Arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)

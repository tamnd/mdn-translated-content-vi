---
title: PasswordCredentialInit
slug: Web/API/PasswordCredentialInit
page-type: web-api-interface
spec-urls: https://w3c.github.io/webappsec-credential-management/#typedefdef-passwordcredentialinit
---

{{APIRef("Credential Management API")}}

Dictionary **`PasswordCredentialInit`** đại diện cho đối tượng được truyền vào {{domxref("CredentialsContainer.create()")}} như giá trị của tùy chọn `password`, khi tạo thông tin đăng nhập mật khẩu.

## Khởi tạo từ biểu mẫu

Thay vì truyền trực tiếp dictionary này, một trang web có thể truyền một {{domxref("HTMLFormElement")}} và việc triển khai `create()` sẽ điền dữ liệu thông tin đăng nhập từ các giá trị của các phần tử có thể gửi trong biểu mẫu, dựa trên giá trị của thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) của phần tử.

| Giá trị `autocomplete`                     | Thuộc tính thông tin đăng nhập được nhắm đến |
| ------------------------------------------ | -------------------------------------------- |
| `"username"`                               | `id`                                         |
| `"name"` hoặc `"nickname"`                 | `name`                                       |
| `"new-password"` hoặc `"current-password"` | `password`                                   |
| `"photo"`                                  | `iconURL`                                    |

Nếu biểu mẫu chứa cả phần tử `"new-password"` và `"current-password"`, giá trị của `"new-password"` sẽ được sử dụng.

Thuộc tính `origin` được đặt thành origin của tài liệu mà {{domxref("HTMLFormElement")}} được chứa trong đó.

## Thuộc tính phiên bản

- `iconURL` {{optional_inline}}
  - : Chuỗi đại diện cho URL của biểu tượng hoặc avatar được liên kết với thông tin đăng nhập.
- `id`
  - : Chuỗi đại diện cho phần tên người dùng của cặp tên người dùng/mật khẩu.
- `name` {{optional_inline}}
  - : Chuỗi đại diện cho tên dễ hiểu với người dùng liên kết với thông tin đăng nhập, nhằm giúp người dùng chọn thông tin đăng nhập này trong giao diện người dùng.
- `origin`
  - : Chuỗi đại diện cho origin của thông tin đăng nhập. Các đối tượng {{domxref("PasswordCredential")}} được ràng buộc với origin, nghĩa là chúng chỉ có thể sử dụng được trên origin được chỉ định mà chúng được dự định sử dụng.
- `password`
  - : Chuỗi đại diện cho mật khẩu thông tin đăng nhập.

## Ví dụ

### Tạo thông tin đăng nhập mật khẩu từ một object literal

Ví dụ này xây dựng một object literal để khởi tạo thông tin đăng nhập mật khẩu.

```js
const credInit = {
  id: "serpent1234", // "username" in a typical username/password pair
  name: "Serpentina", // display name for credential
  origin: "https://example.org",
  password: "the last visible dog",
};

const makeCredential = document.querySelector("#make-credential");

makeCredential.addEventListener("click", async () => {
  const cred = await navigator.credentials.create({
    password: credInit,
  });
  console.log(cred.name);
  // Serpentina
  console.log(cred.id);
  // serpent1234
  console.log(cred.password);
  // the last visible dog
});
```

### Tạo thông tin đăng nhập mật khẩu từ biểu mẫu

Ví dụ này sử dụng biểu mẫu để khởi tạo thông tin đăng nhập mật khẩu.

#### HTML

HTML khai báo một {{HTMLElement("form")}} chứa ba phần tử có thể gửi, đại diện cho ID người dùng, tên hiển thị của người dùng và mật khẩu.

```html
<form>
  <div>
    <label for="displayname">Enter your display name: </label>
    <input
      type="text"
      name="displayname"
      id="displayname"
      autocomplete="name" />
  </div>
  <div>
    <label for="username">Enter your username: </label>
    <input type="text" name="username" id="username" autocomplete="username" />
  </div>
  <div>
    <label for="password">Enter your password: </label>
    <input
      type="password"
      name="password"
      id="password"
      autocomplete="new-password" />
  </div>
</form>

<button id="make-credential">Make credential</button>

<pre id="log"></pre>
```

```css hidden
form {
  display: table;
}

div {
  display: table-row;
}

label,
input {
  display: table-cell;
  margin-bottom: 10px;
}

label {
  padding-right: 10px;
}

#log {
  height: 60px;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

JavaScript truyền biểu mẫu vào `create()` và ghi lại một số giá trị của thông tin đăng nhập kết quả.

```js
const makeCredential = document.querySelector("#make-credential");
const formCreds = document.querySelector("form");

makeCredential.addEventListener("click", async () => {
  try {
    const credential = await navigator.credentials.create({
      password: formCreds,
    });
    log(
      `New credential:\ndisplay name: ${credential.name}, username: ${credential.id}, password: ${credential.password}`,
    );
  } catch (e) {
    if (e.name === "TypeError") {
      log("Error creating credential\nMake sure you filled in all the fields");
    }
  }
});

const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = text;
}
```

#### Kết quả

{{EmbedLiveSample("Creating a password credential from a form", "", "260")}}

## Thông số kỹ thuật

{{Specifications}}

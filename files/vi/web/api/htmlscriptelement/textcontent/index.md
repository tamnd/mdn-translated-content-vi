---
title: "HTMLScriptElement: thuộc tính textContent"
short-title: textContent
slug: Web/API/HTMLScriptElement/textContent
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.textContent
---

{{APIRef("DOM")}}

> [!WARNING]
> Thuộc tính này biểu diễn nội dung văn bản của phần tử tập lệnh, có thể được thực thi tùy theo loại tập lệnh.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Các cân nhắc về bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`textContent`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản nội tuyến của phần tử {{HTMLElement("script")}}.
Nó hoạt động giống như các thuộc tính {{domxref("HTMLScriptElement.text","text")}} và {{domxref("HTMLScriptElement.innerText","innerText")}}.

## Giá trị

Lấy thuộc tính trả về một chuỗi chứa văn bản của tập lệnh.

Đặt thuộc tính chấp nhận một đối tượng {{domxref("TrustedScript")}} hoặc một chuỗi.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu thuộc tính được đặt thành một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được xác định.

## Mô tả

Thuộc tính **`textContent`** của giao diện {{domxref("HTMLScriptElement")}} biểu diễn nội dung văn bản bên trong phần tử {{HTMLElement("script")}}.

Với tập lệnh có thể thực thi (tức là tập lệnh mà {{domxref('HTMLScriptElement/type','type')}} chỉ ra rằng nó là module hoặc classic script), văn bản này là mã có thể thực thi nội tuyến.
Với các loại khác, nó có thể biểu diễn một import map, speculation rules, hoặc một loại khối dữ liệu nào đó.

Lưu ý rằng nếu thuộc tính {{domxref('HTMLScriptElement/src','src')}} được đặt thì nội dung của thuộc tính `textContent` sẽ bị bỏ qua.

Thuộc tính `textContent` cũng được định nghĩa trên {{domxref("Node.textContent","Node")}} và do đó có thể được sử dụng với các nút khác (và các phần tử).
Khi được sử dụng với các phần tử khác, nó không yêu cầu hay thực thi việc gán {{domxref("TrustedScript")}}.

### Các cân nhắc về bảo mật

Thuộc tính `textContent` và các thuộc tính `text` và `innerText` giống hệt nhau là vector có thể dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nơi các chuỗi không an toàn có thể được cung cấp bởi người dùng được thực thi.
Ví dụ, ví dụ sau giả sử `scriptElement` là phần tử `<script>` có thể thực thi, và `untrustedCode` được cung cấp bởi người dùng:

```js
const untrustedCode = "alert('Potentially evil code!');";
scriptElement.textContent = untrustedCode; // hiển thị cảnh báo
```

Bạn có thể giảm thiểu các vấn đề này bằng cách luôn gán các đối tượng {{domxref("TrustedScript")}} thay vì chuỗi, và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng cách sử dụng chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP.
Điều này đảm bảo rằng đầu vào được truyền qua hàm chuyển đổi, có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) hoặc từ chối văn bản trước khi nó được chèn vào.

Hành vi của hàm chuyển đổi sẽ phụ thuộc vào trường hợp sử dụng cụ thể yêu cầu tập lệnh do người dùng cung cấp.
Nếu có thể, bạn nên giới hạn các tập lệnh được phép chính xác là mã mà bạn tin tưởng để chạy.
Nếu điều đó không khả thi, bạn có thể cho phép hoặc chặn việc sử dụng một số hàm nhất định trong chuỗi được cung cấp.

## Ví dụ

### Sử dụng TrustedScript

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các thể hiện `TrustedScript` cho thuộc tính `textContent`.

Trusted types chưa được hỗ trợ trên tất cả trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một thay thế minh bạch cho Trusted Types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo chúng ta tạo {{domxref("TrustedTypePolicy")}} xác định phương thức {{domxref("TrustedTypePolicy/createScript", "createScript()")}} để chuyển đổi chuỗi đầu vào thành các thể hiện {{domxref("TrustedScript")}}.
Với mục đích của ví dụ này, chúng ta sẽ chỉ cho phép đúng tập lệnh mà chúng ta cần.

```js
const policy = trustedTypes.createPolicy("inline-script-policy", {
  createScript(input) {
    // Chỉ định ở đây những tập lệnh nào là an toàn để cho phép
    if (input === "const num = 10;\nconsole.log(num)") {
      return input; // cho phép tập lệnh này
    }
    throw new TypeError(`Untrusted script blocked: ${input}`);
  },
});
```

Tiếp theo chúng ta sẽ tạo phần tử tập lệnh để gán giá trị và lấy tham chiếu đến phần tử.

```html
<script id="el"></script>
```

```js
// Lấy phần tử tập lệnh mà chúng ta đang chèn mã vào
const el = document.getElementById("el");
```

Sau đó chúng ta sử dụng đối tượng `policy` để tạo đối tượng `trustedScript` từ chuỗi đầu vào có thể không an toàn, và gán kết quả cho phần tử:

```js
// Chuỗi có khả năng độc hại
const untrustedScriptOne = "const num = 10;\nconsole.log(num)";

// Tạo thể hiện TrustedScript bằng policy
const trustedScript = policy.createScript(untrustedScriptOne);

// Chèn TrustedScript (chứa chuỗi đáng tin)
el.textContent = trustedScript;
```

### So sánh `textContent`, `text` và `innerText`

Ví dụ này minh họa rằng việc gán một tập lệnh cho mỗi thuộc tính văn bản, chẳng hạn như `textContent`, dẫn đến cùng một giá trị được đọc từ tất cả các thuộc tính văn bản.

Lưu ý rằng trong trường hợp này chúng ta không sử dụng policy để tạo trusted scripts (để ngắn gọn, chúng ta sẽ giả sử các chuỗi được cung cấp là đáng tin).

```js
// Đặt thuộc tính textContent
el.textContent = "console.log(10);";

console.log(`textContent: ${el.textContent}`);
// "textContent: console.log(10);"

console.log(`text: ${el.text}`);
// "text: console.log(10);"

console.log(`innerText: ${el.innerText}`);
// "innerText: console.log(10);"

// Đặt thuộc tính text
el.text = "const num = 10;\nconsole.log(num)";

console.log(`textContent: ${el.textContent}`);
// textContent: const num = 10; console.log(num)"

console.log(`text: ${el.text}`);
// "text: const num = 10; console.log(num)"

console.log(`innerText: ${el.innerText}`);
// "innerText: const num = 10; console.log(num)"

// Đặt thuộc tính innerText
el.innerText = "const num = 10;alert('Help')";

console.log(`textContent: ${el.textContent}`);
// textContent: const num = 10;alert('Help')"

console.log(`text: ${el.text}`);
// "text: const num = 10;alert('Help')"

console.log(`innerText: ${el.innerText}`);
// "innerText: const num = 10;alert('Help')"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.text","text")}}
- {{domxref("HTMLScriptElement.innerText","innerText")}}

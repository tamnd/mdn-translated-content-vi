---
title: "HTMLScriptElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLScriptElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.src
---

{{APIRef("HTML DOM")}}

> [!WARNING]
> Thuộc tính này biểu diễn URI của tập lệnh ngoài được tải vào phần tử tập lệnh, có thể được thực thi tùy theo {{domxref("HTMLScriptElement/type","type")}} của tập lệnh.
> Các API như thế này được gọi là [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là vector dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).
>
> Bạn có thể giảm thiểu rủi ro này bằng cách có [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) hạn chế các vị trí có thể tải tập lệnh, và bằng cách luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Các cân nhắc về bảo mật](#security_considerations) để biết thêm thông tin.

Thuộc tính **`src`** của giao diện {{domxref("HTMLScriptElement")}} là một chuỗi biểu diễn URL của tập lệnh ngoài; có thể được dùng như một lựa chọn thay thế cho việc nhúng tập lệnh trực tiếp trong tài liệu.

Nó phản ánh thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/script#src) của phần tử {{HTMLElement("script")}}.

## Giá trị

Lấy thuộc tính trả về một chuỗi chứa URI tập lệnh của phần tử.

Đặt thuộc tính chấp nhận một đối tượng {{domxref("TrustedScriptURL")}} hoặc một chuỗi.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu thuộc tính được đặt bằng chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [thực thi bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được xác định.
    Ngoại lệ này cũng được ném nếu URL được tìm nạp không thể phân tích thành công theo kiểu đã chỉ định, chẳng hạn như module hoặc importmap.

## Mô tả

Thuộc tính **`src`** biểu diễn URL của tập lệnh ngoài.
Nếu được đặt, các tập lệnh được cung cấp qua các thuộc tính văn bản {{domxref("HTMLScriptElement.text","text")}}, {{domxref("HTMLScriptElement.textContent","textContent")}}, hoặc {{domxref("HTMLScriptElement.textContent","innerText")}}, sẽ bị bỏ qua.

### Các cân nhắc về bảo mật

Thuộc tính `src` được dùng để tải và chạy các tập lệnh ngoài.
Tập lệnh được tìm nạp chạy trong ngữ cảnh của trang hiện tại, và do đó có thể làm bất cứ điều gì mà mã của trang web của bạn có thể làm (ngay cả khi URL không cùng origin với trang của bạn).
Nếu đầu vào được cung cấp bởi người dùng, đây là vector có thể dẫn đến tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS).

Việc chấp nhận và thực thi các URL tùy ý từ các nguồn không đáng tin là cực kỳ rủi ro.
Một trang web nên kiểm soát những tập lệnh nào được phép chạy bằng cách sử dụng [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) với chỉ thị [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) (hoặc một dự phòng được xác định trong [`default-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/default-src)).
Điều này có thể hạn chế các tập lệnh với các tập lệnh từ origin hiện tại, hoặc một tập hợp cụ thể các origin, hoặc thậm chí các tệp cụ thể.

Nếu bạn đang sử dụng thuộc tính này và [thực thi trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) (sử dụng chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) CSP), bạn sẽ cần luôn gán các đối tượng {{domxref("TrustedScriptURL")}} thay vì chuỗi.
Điều này đảm bảo rằng đầu vào được truyền qua hàm chuyển đổi, có cơ hội từ chối hoặc sửa đổi URL trước khi nó được chèn vào.

Ngay cả khi tài nguyên được trang web của bạn tin tưởng, nó vẫn có thể bị xâm phạm trong [cuộc tấn công chuỗi cung ứng](/en-US/docs/Web/Security/Attacks/Supply_chain_attacks).
Để giảm thiểu loại tấn công này, bạn nên sử dụng tính năng [subresource integrity](/en-US/docs/Web/Security/Attacks/Supply_chain_attacks#using_subresource_integrity).

## Ví dụ

### Sử dụng TrustedScriptURL

Để giảm thiểu rủi ro XSS, chúng ta nên luôn gán các thể hiện `TrustedScriptURL` cho thuộc tính `src`.
Chúng ta cũng cần làm điều này nếu chúng ta đang thực thi trusted types vì những lý do khác và muốn cho phép một số nguồn tập lệnh đã được phép (bởi `CSP: script-src`).

Trusted types chưa được hỗ trợ trên tất cả trình duyệt, vì vậy trước tiên chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill).
Điều này hoạt động như một thay thế minh bạch cho Trusted Types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo chúng ta tạo {{domxref("TrustedTypePolicy")}} xác định phương thức {{domxref("TrustedTypePolicy/createScriptURL", "createScriptURL()")}} để chuyển đổi chuỗi đầu vào thành các thể hiện {{domxref("TrustedScriptURL")}}.

Với mục đích của ví dụ này, chúng ta sẽ giả định rằng chúng ta muốn cho phép một tập hợp URL được xác định trước trong mảng `scriptAllowList` và ghi lại bất kỳ tập lệnh nào khác.

```js
const scriptAllowList = [
  // Một số danh sách URL được phép
];
const policy = trustedTypes.createPolicy("script-url-policy", {
  createScriptURL(input) {
    if (scriptAllowList.includes(input)) {
      return input; // cho phép tập lệnh
    }
    console.log(`Script not in scriptAllowList: ${input}`);
    return ""; // Chặn tập lệnh
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

Sau đó chúng ta sử dụng đối tượng `policy` để tạo thể hiện `trustedScriptURL` từ chuỗi đầu vào có thể không an toàn, và gán kết quả cho phần tử:

```js
// Chuỗi có khả năng độc hại
// Chúng ta sẽ không bao gồm untrustedScriptURL trong mảng scriptAllowList
const untrustedScriptURL = "https://evil.example.com/naughty.js";

// Tạo thể hiện TrustedScriptURL bằng policy
const trustedScriptURL = policy.createScriptURL(untrustedScriptURL);

// Chèn TrustedScriptURL (chứa URL đáng tin)
el.src = trustedScriptURL;
```

### Đọc thuộc tính `src`

Ví dụ này cho thấy cách bạn có thể đọc thuộc tính `src` cho hai phần tử tập lệnh bên dưới, giả sử URL trang là `https://example.com`.

```html
<script id="script-with-src" type="module" src="/main.js"></script>
<script id="script-without-src" type="module"></script>
```

Mã đọc từng phần tử tập lệnh và ghi ra kết quả của thuộc tính `src`.

```js
const scriptWithSrc = document.getElementById("script-with-src");
console.log(scriptWithSrc.src); // Kết quả: "https://example.com/main.js"
const scriptWithoutSrc = document.getElementById("script-without-src");
console.log(scriptWithoutSrc.src); // Kết quả: ""
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

---
title: "Content-Security-Policy: script-src directive"
short-title: script-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/script-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.script-src
sidebar: http
---

Chỉ thị **`script-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho JavaScript. Điều này bao gồm không chỉ các URL được tải trực tiếp vào các phần tử {{HTMLElement("script")}}, mà còn các thứ như event handler script nội tuyến (`onclick`) và [XSLT stylesheets](/en-US/docs/Web/XML/XSLT) có thể kích hoạt thực thi script.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>1</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Fetch directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>
        Có. Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
        <code>default-src</code>.
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: script-src 'none';
Content-Security-Policy: script-src <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, bất kỳ giá trị biểu thức nguồn nào được liệt kê trong [cú pháp chỉ thị fetch](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#fetch_directive_syntax) đều có thể áp dụng.

## Ví dụ

### Thêm tài nguyên từ các miền tin cậy vào danh sách cho phép

Với tiêu đề CSP này chỉ cho phép script từ `https://example.com`:

```http
Content-Security-Policy: script-src https://example.com/
```

script sau bị chặn và sẽ không được tải hoặc thực thi:

```html
<script src="https://not-example.com/js/library.js"></script>
```

Lưu ý rằng các event handler nội tuyến cũng bị chặn:

```html
<button id="btn" onclick="doSomething()">Nhấp vào tôi</button>
```

Bạn nên thay thế chúng bằng các lệnh gọi {{domxref("EventTarget.addEventListener", "addEventListener")}}:

```js
document.getElementById("btn").addEventListener("click", doSomething);
```

Nếu bạn không thể thay thế các event handler nội tuyến, bạn có thể sử dụng biểu thức nguồn `'unsafe-hashes'` để cho phép chúng.
Xem [Unsafe hashes](#unsafe_hashes) để biết thêm thông tin.

### Thêm script bên ngoài vào danh sách cho phép bằng hash

Việc cho phép các miền tin cậy, như được hiển thị trong phần trên, là cách tiếp cận rộng rãi để chỉ định các vị trí mà code có thể được tải an toàn.
Đây là cách thực tế, đặc biệt khi trang của bạn sử dụng nhiều tài nguyên và bạn tin tưởng rằng trang web tin cậy sẽ không bị xâm phạm.

Một phương pháp thay thế là chỉ định các script được phép bằng cách sử dụng hash tệp.
Sử dụng cách tiếp cận này, một tệp bên ngoài trong phần tử `<script>` chỉ có thể được tải và thực thi nếu tất cả các giá trị hash hợp lệ trong thuộc tính [`integrity`](/en-US/docs/Web/HTML/Reference/Elements/script#integrity) của nó khớp với các giá trị được phép trong tiêu đề CSP.
Tính năng [Subresource integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) cũng kiểm tra rằng tệp đã tải xuống có giá trị hash được chỉ định, và do đó chưa bị sửa đổi.
Điều này an toàn hơn so với việc tin tưởng một miền, vì các tệp chỉ được sử dụng nếu chúng không bị sửa đổi, ngay cả khi được tải từ một trang web bị xâm phạm.
Tuy nhiên, nó chi tiết hơn và yêu cầu cập nhật giá trị hash trong CSP và các phần tử script bất cứ khi nào script liên quan thay đổi.

Tiêu đề CSP bên dưới minh họa cách tiếp cận.
Nó cho phép các script có hash SHA384 là `oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC` hoặc hash SHA256 là `fictional_value`.

```http
Content-Security-Policy: script-src 'sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC' 'sha256-fictional_value'
```

Script `example-framework.js` bên dưới nên tải vì giá trị hash trong thuộc tính `integrity` của nó cũng có trong CSP (miễn là tệp thực sự có hash đó khi được tải xuống!)

```html
<script
  src="https://example.com/example-framework.js"
  integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
  crossorigin="anonymous"></script>
```

Thuộc tính `integrity` có thể có nhiều giá trị, mỗi giá trị cung cấp hash cho tệp được tính toán bằng thuật toán khác nhau.
Để một script bên ngoài được tải, CSP yêu cầu _tất cả_ các giá trị hash hợp lệ trong thuộc tính phải cũng có trong khai báo `script-src` của CSP.
Do đó script bên dưới sẽ không tải, vì hash thứ hai không có trong tiêu đề CSP ở trên.

```html
<script
  src="https://example.com/example-framework.js"
  integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC sha256-not-in-csp"
  crossorigin="anonymous"></script>
```

Quy tắc này chỉ áp dụng cho các giá trị hash _hợp lệ_.
Các giá trị không được trình duyệt nhận ra là hash sẽ bị bỏ qua, vì vậy script sau nên tải:

```html
<script
  src="https://example.com/example-framework.js"
  integrity="invalid-or-unsupported-hash sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
  crossorigin="anonymous"></script>
```

[Subresource integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) chứa thêm thông tin về cách tính hash và sử dụng thuộc tính `integrity`.

### Script nội tuyến không an toàn

> [!NOTE]
> Không cho phép các style nội tuyến và script nội tuyến là một trong những lợi ích bảo mật lớn nhất mà CSP cung cấp.
> Nếu bạn thực sự phải sử dụng chúng, có một vài cơ chế sẽ cho phép chúng.
> Hash áp dụng cho các script và style nội tuyến, nhưng không áp dụng cho event handler.
> Xem [Unsafe hashes](#unsafe_hashes) để biết thêm thông tin.

Để cho phép các script và style nội tuyến, có thể chỉ định `'unsafe-inline'`, nonce-source hoặc hash-source khớp với khối nội tuyến.
Content Security Policy sau sẽ cho phép tất cả các phần tử {{HTMLElement("script")}} nội tuyến:

```http
Content-Security-Policy: script-src 'unsafe-inline';
```

Phần tử {{HTMLElement("script")}} sau sẽ được phép bởi chính sách:

```html
<script>
  const inline = 1;
  // …
</script>
```

Cho phép tất cả các script nội tuyến được coi là rủi ro bảo mật, vì vậy khuyến nghị sử dụng nonce-source hoặc hash-source thay thế.
Để cho phép các script và style nội tuyến với nonce-source, bạn cần tạo một giá trị {{Glossary("Nonce", "nonce")}} ngẫu nhiên (sử dụng bộ tạo token ngẫu nhiên bảo mật về mặt mật mã) và đưa nó vào chính sách.
Điều quan trọng cần lưu ý là giá trị nonce này cần được tạo động vì nó phải là duy nhất cho mỗi yêu cầu HTTP:

```http
Content-Security-Policy: script-src 'nonce-2726c7f26c'
```

Sau đó, bạn cần đưa cùng nonce vào phần tử {{HTMLElement("script")}}:

```html
<script nonce="2726c7f26c">
  const inline = 1;
  // …
</script>
```

Ngoài ra, bạn có thể tạo hash từ các script nội tuyến. CSP hỗ trợ sha256, sha384 và sha512.

```http
Content-Security-Policy: script-src 'sha256-B2yPHKaXnvFWtRChIbabYmUBFZdVfKKXHbWtWidDVF8='
```

Khi tạo hash, không bao gồm các thẻ {{HTMLElement("script")}} và lưu ý rằng chữ hoa/thường và khoảng trắng có ý nghĩa, bao gồm cả khoảng trắng đầu hoặc cuối.

```html
<script>
  const inline = 1;
</script>
```

### Unsafe hashes

Các chính sách cho tài nguyên nội tuyến với hash như `script-src 'sha256-{HASHED_INLINE_SCRIPT}'` cho phép các script và style bằng hash của chúng, nhưng không phải event handler:

```html
<!-- Được phép bởi CSP: script-src 'sha256-{HASHED_INLINE_SCRIPT}' -->
<script>
  const inline = 1;
</script>

<!-- CSP: script-src 'sha256-{HASHED_EVENT_HANDLER}'
      sẽ không cho phép event handler này -->
<button onclick="myScript()">Gửi</button>
```

Thay vì cho phép `'unsafe-inline'`, bạn có thể sử dụng biểu thức nguồn `'unsafe-hashes'` nếu code không thể được cập nhật thành các lệnh gọi {{domxref("EventTarget.addEventListener", "addEventListener")}} tương đương.
Cho một trang HTML bao gồm event handler nội tuyến sau:

```html
<!-- Tôi muốn sử dụng addEventListener, nhưng tôi không thể :( -->
<button onclick="myScript()">Gửi</button>
```

Tiêu đề CSP sau sẽ cho phép script thực thi:

```http
Content-Security-Policy:  script-src 'unsafe-hashes' 'sha256-{HASHED_EVENT_HANDLER}'
```

### Biểu thức eval không an toàn

Biểu thức nguồn `'unsafe-eval'` kiểm soát một số phương thức thực thi script tạo code từ chuỗi.
Nếu một trang có tiêu đề CSP và `'unsafe-eval'` không được chỉ định với chỉ thị `script-src`, các phương thức sau bị chặn và sẽ không có bất kỳ tác dụng nào:

- {{jsxref("Global_Objects/eval", "eval()")}}
- {{jsxref("Function", "Function()")}}
- Khi truyền chuỗi ký tự cho các phương thức như: `setTimeout("alert(\"Hello World!\");", 500);`
  - {{domxref("Window.setTimeout", "setTimeout()")}}
  - {{domxref("Window.setInterval", "setInterval()")}}
  - {{domxref("Window.setImmediate", "setImmediate()")}}

- `window.execScript()` {{non-standard_inline}} (chỉ IE < 11)

### Thực thi WebAssembly không an toàn

Biểu thức nguồn `'wasm-unsafe-eval'` kiểm soát thực thi WebAssembly.
Nếu một trang có tiêu đề CSP và `'wasm-unsafe-eval'` không được chỉ định trong chỉ thị `script-src`, WebAssembly bị chặn không được tải và thực thi trên trang.

Biểu thức nguồn `'wasm-unsafe-eval'` cụ thể hơn `'unsafe-eval'` cho phép cả biên dịch (và khởi tạo) WebAssembly và, ví dụ, sử dụng thao tác `eval` trong JavaScript.
Nếu từ khóa nguồn `'unsafe-eval'` được sử dụng thì điều này ghi đè lên bất kỳ sự xuất hiện nào của `'wasm-unsafe-eval'` trong chính sách CSP.

```http
Content-Security-Policy: script-src 'wasm-unsafe-eval'
```

### strict-dynamic

Biểu thức nguồn `'strict-dynamic'` chỉ định rằng sự tin cậy được trao rõ ràng cho một script có trong markup, bằng cách kèm theo nó với một nonce hoặc hash, sẽ được lan truyền đến tất cả các script được tải bởi script gốc đó. Đồng thời, bất kỳ danh sách cho phép hoặc biểu thức nguồn nào như `'self'` hoặc `'unsafe-inline'` sẽ bị bỏ qua.

Ví dụ, một chính sách như `script-src 'strict-dynamic' 'nonce-R4nd0m' https://allowlisted.example.com/` sẽ cho phép tải script gốc với `<script nonce="R4nd0m" src="https://example.com/loader.js">` và lan truyền sự tin cậy đó đến bất kỳ script nào được tải bởi `loader.js`, nhưng không cho phép tải script từ `https://allowlisted.example.com/` trừ khi đi kèm với nonce hoặc được tải từ script tin cậy.

```http
Content-Security-Policy: script-src 'strict-dynamic' 'nonce-someNonce'
```

Hoặc:

```http
Content-Security-Policy: script-src 'strict-dynamic' 'sha256-base64EncodedHash'
```

Có thể triển khai `strict-dynamic` theo cách tương thích ngược mà không cần phát hiện user-agent.
Chính sách:

```http
Content-Security-Policy: script-src 'unsafe-inline' https: 'nonce-abcdefg' 'strict-dynamic'
```

sẽ hoạt động như `'unsafe-inline' https:` trong các trình duyệt hỗ trợ CSP1, `https: 'nonce-abcdefg'` trong các trình duyệt hỗ trợ CSP2, và `'nonce-abcdefg' 'strict-dynamic'` trong các trình duyệt hỗ trợ CSP3.

### Cho phép speculation rules

Để đưa [speculation rules](/en-US/docs/Web/API/Speculation_Rules_API) vào một phần tử script (xem thêm [`<script type="speculationrules">`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules)), bạn cần sử dụng chỉ thị `script-src` với một trong các nguồn `'inline-speculation-rules'`, hash-source hoặc nonce-source. Ví dụ:

```http
Content-Security-Policy: script-src 'inline-speculation-rules'
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("script")}}
- {{CSP("script-src-elem")}}
- {{CSP("script-src-attr")}}

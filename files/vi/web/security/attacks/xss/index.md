---
title: Tấn công cross-site scripting (XSS)
slug: Web/Security/Attacks/XSS
page-type: guide
sidebar: security
---

Một cuộc tấn công cross-site scripting (XSS) là kiểu tấn công trong đó kẻ tấn công có thể khiến một site mục tiêu thực thi mã độc như thể nó là một phần của website.

## Tổng quan

Trình duyệt web tải mã từ nhiều website khác nhau và chạy nó trên máy tính của người dùng. Một số website trong số này sẽ rất đáng tin cậy, và người dùng có thể dùng chúng cho các hoạt động nhạy cảm, chẳng hạn giao dịch tài chính hoặc tư vấn y tế. Với những site khác, như một site trò chơi giải trí thông thường, người dùng có thể không có mối quan hệ tin cậy như vậy. Nền tảng của mô hình bảo mật của trình duyệt là các site này phải được giữ tách biệt với nhau, nên mã từ một site không được phép truy cập các đối tượng hoặc {{glossary("credential", "thông tin xác thực")}} ở một site khác. Điều này được gọi là [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy).

![Sơ đồ 2 site trong trình duyệt, ở hai thế giới riêng biệt](same-origin.svg)

Trong một cuộc tấn công XSS thành công, kẻ tấn công có thể phá vỡ same-origin policy bằng cách lừa site mục tiêu thực thi mã độc trong ngữ cảnh của chính nó, như thể nó là same-origin. Khi đó, mã có thể làm bất cứ thứ gì mà mã gốc của site có thể làm, bao gồm, ví dụ:

- Truy cập và/hoặc sửa đổi toàn bộ nội dung của các trang mà site đã tải, và mọi nội dung trong local storage
- Gửi yêu cầu HTTP bằng thông tin xác thực của người dùng, cho phép giả mạo người dùng hoặc truy cập dữ liệu nhạy cảm

![Sơ đồ mã của kẻ tấn công chạy trong website mục tiêu](xss.svg)

Mọi cuộc tấn công XSS đều phụ thuộc vào việc một website làm hai việc:

1. Chấp nhận một số đầu vào có thể do kẻ tấn công tạo ra
2. Đưa đầu vào này vào một trang mà không _sanitizing_ nó: nghĩa là không bảo đảm rằng nó không thể thực thi được như JavaScript.

## Hai ví dụ XSS

Trong phần này, chúng ta sẽ đi qua hai trang ví dụ dễ bị tấn công XSS.

### Chèn mã trong trình duyệt

Trong ví dụ này, giả sử website của ngân hàng người dùng là `my-bank.example.com`. Người dùng thường đăng nhập vào đó, và mã trong website có thể truy cập chi tiết tài khoản của người dùng và thực hiện giao dịch. Website muốn hiển thị một thông báo chào mừng, được cá nhân hóa cho người dùng hiện tại. Nó hiển thị lời chào trong phần tử {{htmlelement("Heading_Elements", "heading")}}:

```html
<h1 id="welcome"></h1>
```

Trang kỳ vọng tìm thấy tên của người dùng hiện tại trong một [tham số URL](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL#parameters). Nó trích xuất giá trị tham số và dùng giá trị đó để tạo một thông điệp chào mừng cá nhân hóa:

```js
const params = new URLSearchParams(window.location.search);
const user = params.get("user");
const welcome = document.querySelector("#welcome");

welcome.innerHTML = `Welcome back, ${user}!`;
```

Giả sử trang này được phục vụ từ `https://my-bank.example.com/welcome`. Để khai thác lỗ hổng, kẻ tấn công gửi cho người dùng một liên kết như sau:

```html
<a
  href="https://my-bank.example.com/welcome?user=<img src=x onerror=alert('hello!')>">
  Get a free kitten!</a
>
```

Khi người dùng bấm vào liên kết:

1. Trình duyệt tải trang.
2. Trang trích xuất tham số URL tên `user`, mà giá trị của nó là `<img src=x onerror=alert("hello!")>`.
3. Sau đó trang gán giá trị này vào thuộc tính `innerHTML` của phần tử `welcome`, tạo ra một phần tử {{htmlelement("img")}} mới, với giá trị thuộc tính `src` là `x`.
4. Vì giá trị `src` tạo ra lỗi, thuộc tính trình xử lý sự kiện `onerror` [event handler property](/en-US/docs/Learn_web_development/Core/Scripting/Events#inline_event_handlers_%e2%80%94_dont_use_these) được thực thi, và kẻ tấn công có thể chạy mã của mình trong trang.

Trong trường hợp này, mã chỉ hiển thị một hộp thoại alert, nhưng trên một website ngân hàng thực tế, mã của kẻ tấn công có thể làm bất cứ gì mà mã front-end của chính ngân hàng có thể làm.

### Chèn mã trong máy chủ

Trong ví dụ này, hãy xem xét một website có chức năng tìm kiếm. HTML cho trang tìm kiếm có thể trông như sau:

```html
<h1>Search</h1>

<form action="/results">
  <label for="mySearch">Search for an item:</label>
  <input id="mySearch" type="search" name="search" />
  <input type="submit" />
</form>
```

Khi người dùng nhập một từ khóa tìm kiếm và bấm "Submit", trình duyệt gửi yêu cầu GET tới "/results", bao gồm từ khóa tìm kiếm như một tham số URL, như sau:

```plain
https://example.org/results?search=bananas
```

Máy chủ muốn hiển thị một danh sách kết quả tìm kiếm, với tiêu đề cho biết người dùng đã tìm gì. Nó trích xuất từ khóa tìm kiếm từ tham số URL. Đây là ví dụ trong [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs):

```js
app.get("/results", (req, res) => {
  const searchQuery = req.query.search;
  const results = getResults(searchQuery); // Implementation not shown
  res.send(`
   <h1>You searched for ${searchQuery}</h1>
   <p>Here are the results: ${results}</p>`);
});
```

Để khai thác lỗ hổng này, kẻ tấn công gửi cho người dùng một liên kết như sau:

```html
<a href="http://example.org/results?search=<img src=x onerror=alert('hello')">
  Get a free kitten!</a
>
```

Khi người dùng bấm vào liên kết:

1. Trình duyệt gửi một yêu cầu GET tới máy chủ. Tham số URL của yêu cầu chứa mã độc.
2. Máy chủ trích xuất giá trị tham số URL và nhúng nó vào trang.
3. Máy chủ trả trang về trình duyệt, và trình duyệt thực thi nó.

## Cấu trúc của một cuộc tấn công XSS

Giống như mọi cuộc tấn công XSS, hai ví dụ này có thể xảy ra vì website:

1. Dùng đầu vào có thể do kẻ tấn công tạo ra
2. Đưa đầu vào vào trang mà không sanitizing nó.

Cả hai ví dụ này đều dùng cùng một vector cho đầu vào độc hại: tham số URL. Tuy nhiên, còn nhiều vector khác mà kẻ tấn công có thể dùng.

Ví dụ, hãy xem một blog có phần bình luận. Trong trường hợp như vậy, website:

1. Cho phép bất kỳ ai gửi bình luận bằng một phần tử {{htmlelement("form")}}
2. Lưu các bình luận trong cơ sở dữ liệu
3. Bao gồm các bình luận trong các trang mà website phục vụ cho người dùng khác

Nếu các bình luận không được sanitizing, thì chúng là các vector tiềm năng cho XSS. Kiểu tấn công này đôi khi được gọi là XSS _stored_ hoặc _persistent_, và đặc biệt nghiêm trọng, vì nội dung bị nhiễm sẽ được phục vụ cho tất cả người dùng truy cập trang, mỗi khi họ truy cập nó.

### XSS phía client và phía server

Một khác biệt lớn giữa hai ví dụ là mã độc được chèn ở những phần khác nhau của codebase website, và điều này phản ánh kiến trúc của từng website.

Một website dùng client-side rendering, như một {{glossary("SPA", "single-page app")}}, sửa đổi các trang trong trình duyệt, bằng cách dùng các web API như {{domxref("document.createElement()")}} để làm điều đó, trực tiếp hoặc gián tiếp qua một framework như React. Chính trong quá trình này XSS sẽ xảy ra. Đó là những gì chúng ta thấy trong ví dụ đầu tiên: mã độc được chèn trong trình duyệt, bởi một script chạy trong trang gán giá trị tham số URL vào thuộc tính {{domxref("Element.innerHTML")}}, vốn diễn giải giá trị của nó như mã HTML.

Một website dùng server-side rendering xây dựng các trang trên máy chủ, bằng cách dùng một framework như Django hoặc Express, phổ biến nhất là bằng cách chèn các giá trị vào template trang. Việc chèn XSS, nếu xảy ra, sẽ xảy ra trên máy chủ trong quá trình dựng template. Đó là những gì chúng ta thấy trong ví dụ thứ hai: mã được chèn trên máy chủ, bởi mã Express chèn giá trị tham số URL vào tài liệu mà nó đang trả về. Mã tấn công XSS sau đó chạy khi trình duyệt đánh giá trang.

Trong cả hai trường hợp, cách tiếp cận chung để phòng vệ là giống nhau, và chúng ta sẽ đi sâu vào điều này trong phần tiếp theo. Tuy nhiên, các công cụ và API cụ thể bạn sẽ dùng sẽ khác nhau.

## Phòng vệ chống XSS

Nếu bạn cần đưa đầu vào bên ngoài vào các trang của site, có hai phòng vệ chính chống XSS:

1. Dùng _output encoding_ và _sanitization_ để ngăn đầu vào trở thành mã thực thi được. Nếu bạn đang render nội dung trong trình duyệt, bạn có thể dùng [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) để bảo đảm rằng đầu vào đã được đưa qua một hàm sanitizing trước khi được đưa vào trang.
2. Dùng [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) (CSP) để cho trình duyệt biết nó được phép thực thi những tài nguyên JavaScript hoặc CSS nào. Đây là lớp phòng vệ dự phòng: nếu lớp phòng vệ đầu tiên thất bại và đầu vào có thể thực thi lọt vào trang, một CSP được cấu hình đúng nên ngăn trình duyệt thực thi nó.

### Output encoding

_Output encoding_ là quá trình trong đó các ký tự trong chuỗi đầu vào có khả năng làm nó nguy hiểm sẽ được escape, để chúng được xử lý như văn bản thay vì như một phần của ngôn ngữ như HTML.

Đây là lựa chọn phù hợp khi bạn muốn coi đầu vào như văn bản, ví dụ vì website của bạn dùng template để chèn đầu vào vào nội dung, như trong đoạn trích [Django template](https://docs.djangoproject.com/en/5.1/ref/templates/language/) sau:

```django
<p>You searched for \{{ search_term }}.</p>
```

Hầu hết các engine template hiện đại đều tự động thực hiện output encoding. Ví dụ, templating engine của Django thực hiện các chuyển đổi sau:

- `<` được chuyển thành `&lt;`

- `>` được chuyển thành `&gt;`

- `'` được chuyển thành `&#x27;`

- `"` được chuyển thành `&quot;`

- `&` được chuyển thành `&amp;`

Điều này có nghĩa là nếu bạn đưa `<img src=x onerror=alert('XSS!')>` vào Django template ở trên, nó sẽ được chuyển thành `&lt;img src=x onerror=alert(&#x27;XSS!&#x27;)&gt;`, và được hiển thị dưới dạng văn bản sau:

> You searched for &lt;img src=x onerror=alert('XSS!')&gt;.

Tương tự, nếu bạn đang làm client-side rendering với React, các giá trị được nhúng trong JSX sẽ được mã hóa tự động. Ví dụ, hãy xem một component JSX như sau:

```jsx
import React from "react";

export function App(props) {
  return <div>Hello, {props.name}!</div>;
}
```

Nếu chúng ta đưa `<img src=x onerror=alert('XSS!')>` vào `props.name`, nó sẽ được render thành:

> Hello, &lt;img src=x onerror=alert('XSS!')&gt;!

Một trong những phần quan trọng nhất của việc ngăn XSS là dùng một engine template được đánh giá tốt, có thực hiện output encoding mạnh, và đọc tài liệu của nó để hiểu bất kỳ lưu ý nào về mức độ bảo vệ mà nó cung cấp.

#### Ngữ cảnh tài liệu

Ngay cả khi bạn dùng một engine template tự động mã hóa HTML, bạn vẫn cần biết bạn đang chèn nội dung không tin cậy ở đâu trong tài liệu. Ví dụ, giả sử bạn có một Django template như sau:

```django
<div>\{{ my_input }}</div>
```

Trong ngữ cảnh này, đầu vào nằm bên trong các thẻ `<div>`, nên trình duyệt sẽ đánh giá nó như HTML. Vì vậy, bạn cần bảo vệ trước trường hợp `my_input` là HTML định nghĩa mã thực thi được, chẳng hạn `<img src=x onerror="alert('XSS')">`. Cơ chế output encoding tích hợp trong Django ngăn cuộc tấn công này bằng cách mã hóa các ký tự như `<` và `>` thành các HTML entity `&lt;` và `&gt;`.

Tuy nhiên, giả sử template là như sau:

```django
<div \{{ my_input }}></div>
```

Trong ngữ cảnh này, trình duyệt sẽ coi biến `my_input` như một thuộc tính HTML. Vì Django mã hóa các dấu ngoặc kép (`"` → `&quot;`, `'` → `&#x27;`), payload `onmouseover="alert('XSS')"` sẽ không thực thi được.
Tuy nhiên, một payload không có dấu ngoặc như `onmouseover=alert(1)` (hoặc dùng backticks, ``onmouseover=alert(`XSS`)``) vẫn sẽ thực thi, vì giá trị thuộc tính không bắt buộc phải được đặt trong dấu ngoặc và backticks không được escape theo mặc định.

Trình duyệt dùng các quy tắc khác nhau để xử lý những phần khác nhau của một trang web - các phần tử HTML và nội dung của chúng, thuộc tính HTML, inline style, inline script. Kiểu mã hóa cần thực hiện sẽ khác nhau tùy theo ngữ cảnh mà đầu vào được chèn vào.

Điều an toàn trong một ngữ cảnh có thể không an toàn trong ngữ cảnh khác, và cần hiểu ngữ cảnh mà bạn đang chèn nội dung không tin cậy vào, rồi triển khai xử lý đặc biệt mà ngữ cảnh đó đòi hỏi.

- **Ngữ cảnh HTML**: đầu vào được chèn giữa các thẻ của hầu hết phần tử HTML (trừ {{htmlelement("style")}} hoặc {{htmlelement("script")}}) sẽ được diễn giải như HTML. Việc mã hóa mà engine template áp dụng chủ yếu nhắm tới ngữ cảnh này.
- **Ngữ cảnh thuộc tính HTML**: chèn đầu vào làm giá trị thuộc tính HTML đôi khi an toàn và đôi khi không, tùy thuộc vào thuộc tính. Đặc biệt, các thuộc tính trình xử lý sự kiện như `onblur` là không an toàn, cũng như thuộc tính [`src`](/en-US/docs/Web/HTML/Reference/Elements/iframe#src) của phần tử {{htmlelement("iframe")}}.

  Cũng rất quan trọng là phải đặt trong dấu ngoặc các placeholder cho giá trị thuộc tính được chèn, nếu không kẻ tấn công có thể chèn thêm một thuộc tính không an toàn trong giá trị được cung cấp. Ví dụ, template này không đặt ngoặc cho giá trị được chèn:

  ```django example-bad
  <div class=\{{ my_class }}>...</div>
  ```

  Kẻ tấn công có thể khai thác điều này để chèn một thuộc tính trình xử lý sự kiện, bằng cách dùng đầu vào như `some_id onmouseover=alert(1)`. Để ngăn cuộc tấn công, hãy đặt ngoặc cho placeholder:

  ```django example-good
    <div class="\{{ my_class }}">...</div>
  ```

- **Ngữ cảnh JavaScript và CSS**: chèn đầu vào bên trong các thẻ {{htmlelement("script")}} hoặc {{htmlelement("style")}} hầu như luôn không an toàn.

### Sanitization

Engine template thường cho phép lập trình viên tắt output encoding. Điều này cần thiết khi lập trình viên muốn chèn nội dung không tin cậy dưới dạng HTML, chứ không phải văn bản. Ví dụ, trong Django, bộ lọc [`safe`](https://docs.djangoproject.com/en/5.0/ref/templates/language/#how-to-turn-it-off) tắt output encoding, và trong React, [`dangerouslySetInnerHTML`](https://react.dev/reference/react-dom/components/common#dangerously-setting-the-inner-html) có cùng tác dụng.

Trong trường hợp này, trách nhiệm thuộc về lập trình viên phải bảo đảm nội dung an toàn, bằng cách sanitizing nó.

_Sanitization_ là quá trình loại bỏ các tính năng không an toàn khỏi một chuỗi HTML: ví dụ, các thẻ {{htmlelement("script")}} hoặc các inline event handler. Vì sanitization, giống như output encoding, rất khó làm đúng, nên nên dùng một thư viện bên thứ ba uy tín cho việc này. [DOMPurify](https://github.com/cure53/DOMPurify) được nhiều chuyên gia, bao gồm [OWASP](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html#html-sanitization), khuyến nghị.

Ví dụ, hãy xem một chuỗi HTML như sau:

```html
<div>
  <img src="x" onerror="alert('hello!')" />
  <script>
    alert("hello!");
  </script>
</div>
```

Nếu chúng ta đưa nó cho DOMPurify, nó sẽ trả về:

```html
<div>
  <img src="x" />
</div>
```

### Trusted types

Có một hàm có thể sanitizing một chuỗi đầu vào nhất định là một chuyện, nhưng tìm tất cả các vị trí trong codebase mà chuỗi đầu vào cần được sanitizing có thể tự thân đã là một vấn đề rất khó.

Nếu bạn đang triển khai client-side rendering trong trình duyệt, có một số Web API không an toàn nếu được gọi với nội dung không tin cậy chưa được sanitizing.

Ví dụ, các API sau diễn giải đối số chuỗi của chúng như HTML và dùng nó để cập nhật DOM của trang:

- {{domxref("Element.innerHTML")}} (cũng được React dùng nội bộ cho `dangerouslySetInnerHTML`)
- {{domxref("Element.outerHTML")}}
- {{domxref("Element.insertAdjacentHTML()")}}
- {{domxref("Document.write()")}}

Các API khác thực thi trực tiếp đối số của chúng như JavaScript. Ví dụ:

- [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval)
- {{domxref("Window.setTimeout()")}} và {{domxref("Window.setInterval()")}}

[Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) cho phép nhà phát triển chắc chắn rằng đầu vào luôn được sanitizing trước khi được đưa vào một trong các API này.

Chìa khóa để thực thi việc dùng trusted types là chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for). Nếu chỉ thị này được đặt, thì việc truyền đối số chuỗi vào các API không an toàn sẽ ném ra ngoại lệ:

```js example-bad
const userInput = "I might be XSS";
const element = document.querySelector("#container");

element.innerHTML = userInput; // Throws a TypeError
```

Thay vào đó, lập trình viên phải truyền một _trusted type_ vào một trong các API này. Trusted type là một đối tượng được tạo từ một chuỗi bởi một đối tượng {{domxref("TrustedTypePolicy")}}, mà cách triển khai được nhà phát triển định nghĩa. Ví dụ:

```js example-good
// Create a policy that can create TrustedHTML values
// by sanitizing the input strings with DOMPurify library.
const sanitizer = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});

const userInput = "I might be XSS";
const element = document.querySelector("#container");

const trustedHTML = sanitizer.createHTML(userInput);
element.innerHTML = trustedHTML;
```

> [!NOTE]
> Trusted Types API không cung cấp hàm sanitizing: nó là một framework trong đó lập trình viên có thể chắc chắn rằng một hàm sanitizing do họ cung cấp đã được gọi. Trong ví dụ trên, lập trình viên dùng DOMPurify làm bộ sanitizing cho HTML sinks, trong framework Trusted Types.

Trusted Types API hiện chưa có hỗ trợ trình duyệt thật tốt, nhưng khi có thì nó sẽ là một phòng vệ quan trọng chống lại các cuộc tấn công XSS dựa trên DOM.

### Triển khai CSP

Output encoding và sanitization đều nhằm ngăn mã độc lọt vào các trang của site. Một trong những chức năng chính của content security policy là ngăn script độc hại được thực thi ngay cả khi chúng có trong trang của site. Nghĩa là, nó là biện pháp dự phòng nếu các phòng vệ khác thất bại.

Cách tiếp cận được khuyến nghị để giảm thiểu XSS với CSP là dùng [strict CSP](/en-US/docs/Web/HTTP/Guides/CSP#strict_csp), vốn dùng một [nonce](/en-US/docs/Web/HTTP/Guides/CSP#nonces) hoặc một [hash](/en-US/docs/Web/HTTP/Guides/CSP#hashes) để chỉ cho trình duyệt biết những script nào nó mong đợi sẽ thấy trong tài liệu. Nếu kẻ tấn công chèn được các phần tử `<script>` độc hại, chúng sẽ không có {{Glossary("Nonce", "nonce")}} hoặc hash đúng, và trình duyệt sẽ không thực thi chúng. Ngoài ra, nhiều vector XSS phổ biến sẽ bị cấm hoàn toàn: inline event handler, URL `javascript:`, và các API như `eval()` thực thi đối số của chúng như JavaScript.

## Danh sách kiểm tra tóm tắt phòng vệ

- Khi chèn nội dung vào một trang, dù là trong trình duyệt hay trên máy chủ, hãy dùng một engine template thực hiện output encoding.
- Hãy chú ý đến ngữ cảnh mà bạn đang chèn nội dung vào, và bảo đảm rằng mã hóa đầu ra phù hợp sẽ được thực hiện trong ngữ cảnh đó.
- Nếu bạn cần chèn nội dung dưới dạng HTML, hãy sanitizing nó bằng một thư viện uy tín. Nếu bạn làm việc này trong trình duyệt, hãy dùng framework trusted types để bảo đảm đầu vào đang được xử lý bởi hàm sanitizing của bạn.
- Triển khai một CSP nghiêm ngặt.

## Xem thêm

- [Cross Site Scripting Prevention Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html) tại [owasp.org](https://owasp.org/)

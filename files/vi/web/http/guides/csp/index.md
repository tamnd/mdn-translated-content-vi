---
title: Content Security Policy (CSP)
slug: Web/HTTP/Guides/CSP
page-type: guide
sidebar: http
---

**Content Security Policy** (CSP) là tính năng giúp ngăn chặn hoặc giảm thiểu rủi ro của một số loại mối đe dọa bảo mật. Nó bao gồm một loạt hướng dẫn từ trang web đến trình duyệt, hướng dẫn trình duyệt đặt ra các hạn chế đối với những gì code cấu thành trang web được phép làm.

Trường hợp sử dụng chính của CSP là kiểm soát các tài nguyên, đặc biệt là tài nguyên JavaScript, mà tài liệu được phép tải. Điều này chủ yếu được sử dụng như một biện pháp phòng vệ chống lại các cuộc tấn công {{glossary("cross-site scripting")}} (XSS), trong đó kẻ tấn công có thể tiêm code độc hại vào trang web của nạn nhân.

CSP cũng có thể phục vụ các mục đích khác, bao gồm bảo vệ chống lại [clickjacking](/en-US/docs/Web/Security/Attacks/Clickjacking) và giúp đảm bảo rằng các trang của trang web sẽ được tải qua HTTPS.

Trong hướng dẫn này, chúng ta sẽ bắt đầu bằng cách mô tả cách CSP được gửi đến trình duyệt và trông như thế nào ở mức độ cao.

Sau đó chúng ta sẽ mô tả cách nó có thể được sử dụng để:

1. [Kiểm soát các tài nguyên được tải](#controlling_resource_loading), để bảo vệ chống lại XSS.
2. [Hạn chế nhúng](#clickjacking_protection), để bảo vệ chống lại clickjacking.
3. [Nâng cấp các yêu cầu không an toàn](#upgrading_insecure_requests), để giúp đảm bảo tất cả tài nguyên được phục vụ qua HTTPS.
4. [Yêu cầu sử dụng trusted types](#requiring_trusted_types), để giúp bảo vệ chống lại XSS phía client.

Lưu ý rằng không có sự phụ thuộc giữa các trường hợp sử dụng khác nhau: nếu bạn muốn thêm bảo vệ clickjacking nhưng không giảm thiểu XSS, bạn chỉ cần thêm các chỉ thị cho trường hợp sử dụng đó.

Cuối cùng chúng ta sẽ mô tả [chiến lược triển khai CSP](#testing_your_policy) và các công cụ có thể giúp làm cho quá trình này dễ dàng hơn.

## Tổng quan về CSP

CSP nên được gửi đến trình duyệt trong header phản hồi {{httpheader("Content-Security-Policy")}}. Nó nên được đặt trên tất cả các phản hồi cho tất cả các yêu cầu, không chỉ tài liệu chính.

Bạn cũng có thể chỉ định nó bằng thuộc tính [`http-equiv`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv) của phần tử {{htmlelement("meta")}} trong tài liệu, và đây là một tùy chọn hữu ích cho một số trường hợp sử dụng, chẳng hạn như {{glossary("SPA", "ứng dụng trang đơn")}} được render phía client chỉ có tài nguyên tĩnh, vì bạn có thể tránh phụ thuộc vào bất kỳ cơ sở hạ tầng máy chủ nào. Tuy nhiên, tùy chọn này không hỗ trợ tất cả các tính năng CSP.

Chính sách được chỉ định dưới dạng một loạt _chỉ thị_, được phân tách bằng dấu chấm phẩy. Mỗi chỉ thị kiểm soát một khía cạnh khác nhau của chính sách bảo mật. Mỗi chỉ thị có tên, theo sau là khoảng trắng, theo sau là giá trị. Các chỉ thị khác nhau có thể có cú pháp khác nhau.

Ví dụ: hãy xem CSP sau:

```http
Content-Security-Policy: default-src 'self'; img-src 'self' example.com
```

Nó đặt hai chỉ thị:

- chỉ thị `default-src` được đặt thành `'self'`
- chỉ thị `img-src` được đặt thành `'self' example.com`.

![CSP được chia thành các chỉ thị của nó.](csp-overview.svg)

Chỉ thị đầu tiên, `default-src`, cho trình duyệt biết chỉ tải các tài nguyên cùng nguồn gốc với tài liệu, trừ khi các chỉ thị cụ thể hơn khác đặt chính sách khác cho các loại tài nguyên khác. Chỉ thị thứ hai, `img-src`, cho trình duyệt biết tải hình ảnh cùng nguồn gốc hoặc được phục vụ từ `example.com`.

Trong phần tiếp theo, chúng ta sẽ xem xét các công cụ có sẵn để kiểm soát tải tài nguyên, đây là chức năng chính của CSP.

## Kiểm soát tải tài nguyên

CSP có thể được sử dụng để kiểm soát các tài nguyên mà tài liệu được phép tải. Điều này chủ yếu được sử dụng để bảo vệ chống lại các cuộc tấn công cross-site scripting (XSS).

Trong phần này, trước tiên chúng ta sẽ xem cách kiểm soát tải tài nguyên có thể giúp bảo vệ chống lại XSS, sau đó là các công cụ CSP cung cấp để kiểm soát tài nguyên nào được tải. Cuối cùng chúng ta sẽ mô tả một chiến lược được khuyến nghị cụ thể, được gọi là "Strict CSP".

### XSS và tải tài nguyên

Cuộc tấn công cross-site scripting (XSS) là cuộc tấn công trong đó kẻ tấn công có thể thực thi code của họ trong ngữ cảnh của trang web mục tiêu. Code này sau đó có thể làm bất cứ điều gì mà code của trang web có thể làm, bao gồm, ví dụ:

- truy cập hoặc sửa đổi nội dung của các trang được tải của trang web
- truy cập hoặc sửa đổi nội dung trong bộ nhớ cục bộ
- thực hiện các yêu cầu HTTP với thông tin xác thực của người dùng, cho phép họ mạo danh người dùng hoặc truy cập dữ liệu nhạy cảm

Cuộc tấn công XSS có thể thực hiện được khi trang web chấp nhận một số đầu vào có thể đã được tạo ra bởi kẻ tấn công (ví dụ: tham số URL hoặc nhận xét trên bài đăng blog) và sau đó đưa nó vào trang mà không _làm sạch_ nó: tức là không đảm bảo rằng nó không thể được thực thi như JavaScript.

Các trang web nên tự bảo vệ chống lại XSS bằng cách làm sạch đầu vào này trước khi đưa nó vào trang.

> [!NOTE]
> CSP thực sự có thể giúp bảo vệ chống lại XSS theo hai cách khác nhau:
>
> - Nó có thể giúp đảm bảo rằng đầu vào được làm sạch trước khi được sử dụng trên client: chúng ta thảo luận về điều này sau trong [Yêu cầu trusted types](#requiring_trusted_types).
> - Bằng cách kiểm soát tải tài nguyên, CSP có thể cung cấp phòng thủ theo chiều sâu chống lại XSS, bảo vệ trang web ngay cả khi việc làm sạch thất bại. Đây là biện pháp bảo vệ XSS mà chúng ta sẽ thảo luận trong phần này.

Nếu việc làm sạch thất bại, có nhiều dạng code độc hại được tiêm có thể xuất hiện trong tài liệu, bao gồm:

- Thẻ {{htmlelement("script")}} liên kết đến nguồn độc hại:

  ```html
  <script src="https://evil.example.com/hacker.js"></script>
  ```

- Thẻ `<script>` bao gồm JavaScript inline:

  ```html
  <script>
    console.log("You've been hacked!");
  </script>
  ```

- Trình xử lý sự kiện inline:

  ```html
  <img
    onmouseover="console.log(`You've been hacked!`)"
    src="thumbnail.jpg"
    alt="" />
  ```

- URL `javascript:`:

  ```html
  <iframe src="javascript:console.log(`You've been hacked!`)"></iframe>
  ```

- Đối số chuỗi cho API không an toàn như [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval):

  ```js
  eval("console.log(`You've been hacked!`)");
  ```

Bằng cách kiểm soát tải tài nguyên, CSP có thể cung cấp bảo vệ chống lại tất cả những điều này. Với CSP, bạn có thể:

- xác định các nguồn được phép cho các tệp JavaScript và các tài nguyên khác, ngăn chặn hiệu quả việc tải từ `https://evil.example.com`
- vô hiệu hóa các thẻ script inline
- chỉ cho phép các thẻ script có {{Glossary("Nonce", "nonce")}} hoặc hash đúng được đặt
- vô hiệu hóa các trình xử lý sự kiện inline
- vô hiệu hóa URL `javascript:`
- vô hiệu hóa các API nguy hiểm như `eval()`

Trong phần tiếp theo, chúng ta sẽ đi qua các công cụ CSP cung cấp để làm những điều này.

> [!NOTE]
> Thiết lập CSP không phải là thay thế cho việc làm sạch đầu vào. Các trang web nên làm sạch đầu vào _và_ đặt CSP, cung cấp phòng thủ theo chiều sâu chống lại XSS.

### Chỉ thị fetch

Các chỉ thị fetch được sử dụng để chỉ định một danh mục tài nguyên cụ thể mà tài liệu được phép tải — chẳng hạn như JavaScript, CSS stylesheets, hình ảnh, phông chữ, v.v.

Có các chỉ thị fetch khác nhau cho các loại tài nguyên khác nhau. Ví dụ:

- [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src) đặt các nguồn được phép cho JavaScript.
- [`style-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src) đặt các nguồn được phép cho CSS stylesheets.
- [`img-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/img-src) đặt các nguồn được phép cho hình ảnh.

Một chỉ thị fetch đặc biệt là `default-src`, đặt chính sách dự phòng cho tất cả các tài nguyên mà chỉ thị của chúng không được liệt kê rõ ràng.

Để biết bộ đầy đủ các chỉ thị fetch, xem [tài liệu tham khảo](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#fetch_directives).

Mỗi chỉ thị fetch được chỉ định là từ khóa đơn `'none'` hoặc một hoặc nhiều _biểu thức nguồn_, phân tách bằng khoảng trắng. Khi nhiều hơn một biểu thức nguồn được liệt kê: nếu bất kỳ phương pháp nào cho phép tài nguyên, thì tài nguyên được phép.

Ví dụ: CSP bên dưới đặt hai chỉ thị fetch:

- `default-src` được cho biểu thức nguồn đơn `'self'`
- `img-src` được cho hai biểu thức nguồn: `'self'` và `example.com`

![Sơ đồ CSP hiển thị các biểu thức nguồn](csp-source-expressions.svg)

Hiệu quả của điều này là:

- hình ảnh phải là cùng nguồn gốc với tài liệu, hoặc được tải từ `example.com`
- tất cả các tài nguyên khác phải cùng nguồn gốc với tài liệu.

Trong các phần tiếp theo, chúng ta sẽ mô tả một số cách bạn có thể sử dụng biểu thức nguồn để kiểm soát tải tài nguyên. Lưu ý rằng mặc dù chúng ta mô tả chúng riêng biệt, các biểu thức này về nguyên tắc có thể được kết hợp: ví dụ: một chỉ thị fetch đơn có thể bao gồm cả nonces lẫn tên máy chủ.

#### Chặn tài nguyên

Để chặn hoàn toàn một loại tài nguyên, hãy sử dụng từ khóa `'none'`. Ví dụ: chỉ thị sau chặn tất cả tài nguyên {{htmlelement("object")}} và {{htmlelement("embed")}}:

```http
Content-Security-Policy: object-src 'none'
```

Lưu ý rằng `'none'` không thể được kết hợp với bất kỳ phương pháp nào khác trong một chỉ thị cụ thể: trong thực tế, nếu bất kỳ biểu thức nguồn nào khác được đưa ra cùng với `'none'`, chúng sẽ bị bỏ qua.

#### Nonces

`nonce` là cách tiếp cận được khuyến nghị để hạn chế việc tải tài nguyên {{htmlelement("script")}} và {{htmlelement("style")}}.

Với nonce, máy chủ tạo một giá trị ngẫu nhiên cho mỗi phản hồi HTTP và đưa nó vào chỉ thị `script-src` và/hoặc `style-src`:

```http
Content-Security-Policy:
  script-src 'nonce-416d1177-4d12-4e3b-b7c9-f6c409789fb8'
```

Sau đó máy chủ bao gồm giá trị này làm giá trị của thuộc tính `nonce` của tất cả các thẻ `<script>` và/hoặc `<style>` mà họ có ý định đưa vào tài liệu.

Trình duyệt so sánh hai giá trị và chỉ tải tài nguyên nếu chúng khớp. Ý tưởng là ngay cả khi kẻ tấn công có thể chèn một số JavaScript vào trang, họ sẽ không biết nonce nào mà máy chủ sẽ sử dụng, vì vậy trình duyệt sẽ từ chối chạy script.

Để phương pháp này hoạt động, kẻ tấn công không được đoán được nonce.

**Trong thực tế, điều này có nghĩa là nonce phải khác cho mỗi phản hồi HTTP và không thể dự đoán được.**

Điều này đến lượt nó có nghĩa là máy chủ không thể phục vụ HTML tĩnh, vì nó phải chèn một nonce mới mỗi lần. Thông thường máy chủ sẽ sử dụng một engine template để chèn nonce.

Đây là đoạn code [Express](/en-US/docs/Learn_web_development/Extensions/Server-side/Express_Nodejs) để minh họa:

```js
function content(nonce) {
  return `
    <script nonce="${nonce}" src="/main.js"></script>
    <script nonce="${nonce}">console.log("hello!");</script>
    <h1>Hello world</h1> 
    `;
}

app.get("/", (req, res) => {
  const nonce = crypto.randomUUID();
  res.setHeader("Content-Security-Policy", `script-src 'nonce-${nonce}'`);
  res.send(content(nonce));
});
```

Trong mỗi yêu cầu, máy chủ tạo một nonce mới, chèn nó vào CSP và vào các thẻ {{htmlelement("script")}} trong tài liệu được trả về. Lưu ý rằng máy chủ:

- tạo nonce mới cho mỗi yêu cầu
- có thể sử dụng nonces với cả script bên ngoài và script inline
- sử dụng cùng nonce cho tất cả thẻ `<script>` trong tài liệu

Điều quan trọng là máy chủ sử dụng một số loại template để chèn nonces và không chỉ chèn chúng vào tất cả thẻ `<script>`: nếu không, máy chủ có thể vô tình chèn nonces vào các script được tiêm bởi kẻ tấn công.

Lưu ý rằng nonces chỉ có thể được sử dụng cho các phần tử có thuộc tính `nonce`: tức là, chỉ các phần tử `<script>` và `<style>`.

#### Hashes

Các chỉ thị fetch cũng có thể sử dụng hash của script để đảm bảo tính toàn vẹn của nó. Với phương pháp này, máy chủ:

1. tính toán hash của nội dung script bằng {{glossary("hash function", "hàm hash")}} (một trong SHA-256, SHA-384, hoặc SHA-512)
2. tạo mã hóa {{glossary("Base64")}} của kết quả
3. thêm tiền tố xác định thuật toán hash được sử dụng (một trong `sha256-`, `sha384-`, hoặc `sha512-`).

Sau đó nó thêm kết quả vào chỉ thị:

```http
Content-Security-Policy: script-src 'sha256-cd9827ad...'
```

Khi trình duyệt nhận tài liệu, nó hash script, so sánh kết quả với giá trị từ header và chỉ tải script nếu chúng khớp.

Script bên ngoài cũng phải bao gồm thuộc tính [`integrity`](/en-US/docs/Web/HTML/Reference/Elements/script#integrity) để phương pháp này hoạt động.

Đây là đoạn code Express để minh họa:

```js
const hash1 = "sha256-ex2O7MWOzfczthhKm6azheryNVoERSFrPrdvxRtP8DI=";
const hash2 = "sha256-H/eahVJiG1zBXPQyXX0V6oaxkfiBdmanvfG9eZWSuEc=";

const csp = `script-src '${hash1}' '${hash2}'`;
const content = `
  <script src="./main.js" integrity="${hash2}"></script>
  <script>console.log("hello!");</script>
    <h1>Hello world</h1> 
    `;

app.get("/", (req, res) => {
  res.setHeader("Content-Security-Policy", csp);
  res.send(content);
});
```

Lưu ý rằng:

- Chúng ta có hash riêng biệt cho mỗi script trong tài liệu.
- Đối với script bên ngoài "main.js", chúng ta cũng bao gồm thuộc tính `integrity` và cho nó cùng giá trị.
- Không giống như ví dụ sử dụng nonces, cả CSP và nội dung đều có thể là tĩnh, vì các hashes vẫn giống nhau. Điều này làm cho các chính sách dựa trên hash phù hợp hơn cho các trang tĩnh hoặc các trang web dựa trên render phía client.

#### Chính sách dựa trên scheme

Các chỉ thị fetch có thể liệt kê một scheme, như `https:`, để cho phép các tài nguyên được phục vụ bằng scheme đó. Ví dụ: điều này cho phép một chính sách yêu cầu HTTPS cho tất cả tải tài nguyên:

```http
Content-Security-Policy: default-src https:
```

#### Chính sách dựa trên vị trí

Các chỉ thị fetch có thể kiểm soát tải tài nguyên dựa trên vị trí của tài nguyên.

Từ khóa `'self'` cho phép các tài nguyên cùng nguồn gốc với chính tài liệu:

```http
Content-Security-Policy: img-src 'self'
```

Bạn cũng có thể chỉ định một hoặc nhiều tên máy chủ, có thể bao gồm ký tự đại diện, và chỉ các tài nguyên được phục vụ từ những máy chủ đó sẽ được phép. Ví dụ: điều này có thể được sử dụng để cho phép nội dung được phục vụ từ CDN đáng tin cậy.

```http
Content-Security-Policy: img-src *.example.org
```

Bạn có thể chỉ định nhiều vị trí. Chỉ thị sau chỉ cho phép hình ảnh cùng nguồn gốc với tài liệu hiện tại, hoặc được phục vụ từ một tên miền con của "example.org", hoặc được phục vụ từ "example.com":

```http
Content-Security-Policy: img-src 'self' *.example.org  example.com
```

#### JavaScript inline

Nếu CSP chứa chỉ thị `default-src` hoặc `script-src`, JavaScript inline sẽ không được phép thực thi trừ khi có biện pháp bổ sung để kích hoạt nó. Điều này bao gồm:

- JavaScript được bao gồm bên trong phần tử `<script>` trong trang:

  ```html
  <script>
    console.log("Hello from an inline script");
  </script>
  ```

- JavaScript trong thuộc tính trình xử lý sự kiện inline:

  ```html
  <img src="x" onerror="console.log('Hello from an inline event handler')" />
  ```

- JavaScript trong URL `javascript:`:

  ```html
  <a href="javascript:console.log('Hello from a javascript: URL')">Click me</a>
  ```

Từ khóa `unsafe-inline` có thể được sử dụng để ghi đè hạn chế này. Ví dụ: chỉ thị sau yêu cầu tất cả tài nguyên cùng nguồn gốc, nhưng cho phép JavaScript inline:

```http example-bad
Content-Security-Policy: default-src 'self' 'unsafe-inline'
```

> [!WARNING]
> Các nhà phát triển nên tránh `'unsafe-inline'`, vì nó làm mất phần lớn mục đích của việc có CSP. JavaScript inline là một trong những vector XSS phổ biến nhất và một trong những mục tiêu cơ bản nhất của CSP là ngăn chặn việc sử dụng không kiểm soát của nó.

Các phần tử `<script>` inline được phép nếu chúng được bảo vệ bởi nonce hoặc hash, như được mô tả ở trên.

Nếu một chỉ thị chứa biểu thức nonce hoặc hash, từ khóa `unsafe-inline` bị bỏ qua bởi trình duyệt.

#### `eval()` và các API tương tự

Giống như JavaScript inline, nếu CSP chứa chỉ thị `default-src` hoặc `script-src`, `eval()` và các API tương tự sẽ không được phép thực thi. Điều này bao gồm, trong số các API khác:

- [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) bản thân:

  ```js
  eval('console.log("hello from eval()")');
  ```

- Hàm tạo {{jsxref("Function/Function()", "Function()")}}:

  ```js
  const sum = new Function("a", "b", "return a + b");
  ```

- Đối số chuỗi cho {{domxref("Window.setTimeout()", "setTimeout()")}} và {{domxref("Window.setInterval()", "setInterval()")}}:

  ```js
  setTimeout("console.log('hello from setTimeout')", 1);
  ```

Từ khóa `unsafe-eval` có thể được sử dụng để ghi đè hành vi này, và như với `unsafe-inline`, và vì lý do tương tự: **các nhà phát triển nên tránh `unsafe-eval`**.

Đôi khi có thể khó xóa việc sử dụng `eval()` và các phương thức khác: trong những tình huống này, [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) có thể làm cho nó an toàn hơn, bằng cách đảm bảo rằng đầu vào đáp ứng một chính sách được xác định. Từ khóa `trusted-types-eval` nên được sử dụng để ghi đè hành vi trong trường hợp này. Không giống như `unsafe-inline`, nó chỉ ghi đè hành vi trong trình duyệt khi trusted types được hỗ trợ và kích hoạt; điều này đảm bảo rằng các phương thức sẽ vẫn bị chặn trên các trình duyệt không hỗ trợ trusted types.

Không giống như `unsafe-inline`, từ khóa `unsafe-eval` vẫn hoạt động trong một chỉ thị chứa biểu thức nonce hoặc hash.

### Strict CSP

Để kiểm soát tải script như một biện pháp giảm thiểu XSS, thực hành được khuyến nghị là sử dụng các chỉ thị fetch dựa trên [nonce-](#nonces) hoặc [hash-](#hashes). Điều này được gọi là _strict CSP_. Loại CSP này có hai lợi thế chính so với CSP dựa trên vị trí (thường được gọi là _allowlist CSP_):

- Allowlist CSP khó có được chính xác và các chính sách thường vô tình đưa vào whitelist các domain không an toàn, và do đó không cung cấp bảo vệ hiệu quả chống lại XSS (xem [CSP Is Dead, Long Live CSP! On the Insecurity of Whitelists and the Future of Content Security Policy](https://dl.acm.org/doi/pdf/10.1145/2976749.2978363)).
- Allowlist CSP có thể rất lớn và khó bảo trì, đặc biệt khi sử dụng các script nằm ngoài tầm kiểm soát của bạn. Theo [How I learned to stop worrying and love the Content Security Policy](https://www.netlify.com/blog/general-availability-content-security-policy-csp-nonce-integration/), chỉ để tích hợp Google Analytics, một nhà phát triển được yêu cầu thêm 187 domain Google vào allowlist.

Một strict CSP dựa trên nonce trông như thế này:

```http
Content-Security-Policy:
  script-src 'nonce-{RANDOM}';
  object-src 'none';
  base-uri 'none';
```

Trong CSP này, chúng ta:

- sử dụng nonces để kiểm soát tài nguyên JavaScript nào được phép tải
- chặn tất cả embed đối tượng
- chặn tất cả việc sử dụng phần tử `<base>` để đặt URI cơ sở.

Strict CSP dựa trên hash là như nhau, ngoại trừ nó sử dụng hashes thay vì nonces:

```http
Content-Security-Policy:
  script-src 'sha256-{HASHED_SCRIPT}';
  object-src 'none';
  base-uri 'none';
```

Các chỉ thị dựa trên nonce dễ bảo trì hơn nếu bạn có thể tạo các phản hồi, bao gồm cả nội dung, một cách động. Nếu không, bạn cần sử dụng các chỉ thị dựa trên hash. Vấn đề với các chỉ thị dựa trên hash là bạn cần tính lại và áp dụng lại hash nếu có bất kỳ thay đổi nào được thực hiện đối với nội dung script.

#### Từ khóa `strict-dynamic`

Như đã trình bày ở trên, strict CSP khó thực hiện khi bạn sử dụng các script không nằm dưới sự kiểm soát của bạn. Nếu một script của bên thứ ba tải bất kỳ script bổ sung nào, hoặc sử dụng bất kỳ script inline nào, điều đó sẽ thất bại, vì script bên thứ ba sẽ không chuyển nonce hoặc hash.

Từ khóa `strict-dynamic` được cung cấp để giúp với vấn đề này. Đây là từ khóa có thể được bao gồm trong chỉ thị fetch và có tác dụng là nếu một script có nonce hoặc hash được đính kèm với nó, thì script đó sẽ được phép tải thêm các script không có nonces hoặc hashes. Tức là, sự tin tưởng đặt vào một script bởi nonce hoặc hash được chuyển sang các script mà script gốc tải (và các script mà _chúng_ tải, v.v.).

Ví dụ: hãy xem xét một tài liệu như thế này:

```html
<html lang="en-US">
  <head>
    <script
      src="./main.js"
      integrity="sha256-gEh1+8U9S1vkEuQSmmUMTZjyNSu5tIoECP4UXIEjMTk="></script>
  </head>
  <body>
    <h1>Example page!</h1>
  </body>
</html>
```

Nó bao gồm một script "main.js", tạo và thêm một script khác, "main2.js":

```js
console.log("hello");

const scriptElement = document.createElement("script");
scriptElement.src = `main2.js`;

document.head.appendChild(scriptElement);
```

Chúng ta phục vụ tài liệu với CSP như thế này:

```http
Content-Security-Policy:
  script-src 'sha256-gEh1+8U9S1vkEuQSmmUMTZjyNSu5tIoECP4UXIEjMTk='
```

Script "main.js" sẽ được phép tải, vì hash của nó khớp với giá trị trong CSP. Nhưng nỗ lực tải "main2.js" của nó sẽ thất bại.

Nếu chúng ta thêm `'strict-dynamic'` vào CSP, thì "main.js" sẽ được phép tải "main2.js":

```http
Content-Security-Policy:
  script-src 'sha256-gEh1+8U9S1vkEuQSmmUMTZjyNSu5tIoECP4UXIEjMTk='
  'strict-dynamic'
```

Từ khóa `'strict-dynamic'` giúp tạo và bảo trì CSP dựa trên nonce hoặc hash dễ dàng hơn nhiều, đặc biệt khi trang web sử dụng các script của bên thứ ba. Tuy nhiên, nó làm cho CSP của bạn kém an toàn hơn, vì nếu các script bạn đưa vào tạo các phần tử `<script>` dựa trên các nguồn tiềm năng của XSS, thì CSP sẽ không bảo vệ chúng.

#### Cấu trúc lại JavaScript inline và `eval()`

Chúng ta đã thấy ở trên rằng JavaScript inline bị cấm theo mặc định trong CSP. Với nonces hoặc hashes, một nhà phát triển có thể sử dụng các thẻ `<script>` inline, nhưng bạn vẫn cần cấu trúc lại code để xóa các mẫu không được phép khác, bao gồm các trình xử lý sự kiện inline, URL `javascript:` và việc sử dụng `eval()`. Ví dụ: các trình xử lý sự kiện inline thường nên được thay thế bằng các cuộc gọi đến {{domxref("EventTarget.addEventListener()", "addEventListener()")}}:

```html example-bad
<p onclick="console.log('Hello from an inline event handler')">click me</p>
```

```html
<!-- served with the following CSP:
 `script-src 'sha256-AjYfua7yQhrSlg807yyeaggxQ7rP9Lu0Odz7MZv8cL0='`
 -->
<p id="hello">click me</p>
<script>
  const hello = document.querySelector("#hello");
  hello.addEventListener("click", () => {
    console.log("Hello from an inline script");
  });
</script>
```

## Bảo vệ clickjacking

Chỉ thị [`frame-ancestors`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors) có thể được sử dụng để kiểm soát tài liệu nào, nếu có, được phép nhúng tài liệu này trong ngữ cảnh duyệt web lồng nhau như {{htmlelement("iframe")}}. Đây là biện pháp bảo vệ hiệu quả chống lại các cuộc tấn công clickjacking, vì những cuộc tấn công này phụ thuộc vào việc nhúng trang mục tiêu vào trang do kẻ tấn công kiểm soát.

Cú pháp của `frame-ancestors` là tập hợp con của cú pháp chỉ thị fetch: bạn có thể cung cấp giá trị từ khóa đơn `'none'` hoặc một hoặc nhiều biểu thức nguồn. Tuy nhiên, các biểu thức nguồn duy nhất bạn có thể sử dụng là schemes, tên máy chủ, hoặc giá trị từ khóa `'self'`.

Trừ khi bạn cần trang web của mình có thể nhúng được, bạn nên đặt `frame-ancestors` thành `'none'`:

```http
Content-Security-Policy: frame-ancestors 'none'
```

Chỉ thị này là thay thế linh hoạt hơn cho header {{httpheader("X-Frame-Options")}}.

## Nâng cấp các yêu cầu không an toàn

Các nhà phát triển web được khuyến khích mạnh mẽ phục vụ tất cả nội dung của họ qua HTTPS. Trong quá trình nâng cấp trang web lên HTTPS, trang web đôi khi phục vụ tài liệu chính qua HTTPS nhưng phục vụ tài nguyên của nó qua HTTP, ví dụ: sử dụng đánh dấu như thế này:

```html
<script src="http://example.org/my-cat.js"></script>
```

Đây được gọi là _nội dung hỗn hợp_ và sự hiện diện của các tài nguyên không an toàn làm giảm đáng kể sự bảo vệ mà HTTPS cung cấp. Theo [thuật toán nội dung hỗn hợp](/en-US/docs/Web/Security/Defenses/Mixed_content) mà trình duyệt triển khai, nếu tài liệu được phục vụ qua HTTPS, các tài nguyên không an toàn được phân loại thành "nội dung có thể nâng cấp" và "nội dung có thể chặn". Nội dung có thể nâng cấp được nâng cấp lên HTTPS và nội dung có thể chặn bị chặn, có khả năng làm hỏng trang.

Giải pháp cuối cùng cho nội dung hỗn hợp là để các nhà phát triển tải tất cả tài nguyên qua HTTPS. Tuy nhiên, ngay cả khi một trang web thực sự có khả năng phục vụ tất cả nội dung qua HTTPS, nó vẫn có thể rất khó (hoặc thậm chí thực tế không thể, khi nói đến nội dung được lưu trữ) để nhà phát triển viết lại tất cả URL mà trang web sử dụng để tải tài nguyên.

Chỉ thị [`upgrade-insecure-requests`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/upgrade-insecure-requests) được thiết kế để giải quyết vấn đề này. Chỉ thị này không có giá trị nào: để đặt nó, chỉ cần bao gồm tên chỉ thị:

```http
Content-Security-Policy: upgrade-insecure-requests
```

Nếu chỉ thị này được đặt trên tài liệu, trình duyệt sẽ tự động nâng cấp lên HTTPS bất kỳ URL HTTP nào trong các trường hợp sau:

- yêu cầu tải tài nguyên (chẳng hạn như hình ảnh, script hoặc phông chữ)
- yêu cầu điều hướng (chẳng hạn như mục tiêu liên kết) cùng nguồn gốc với tài liệu
- yêu cầu điều hướng trong ngữ cảnh duyệt web lồng nhau, chẳng hạn như iframes
- gửi form

Tuy nhiên, các yêu cầu điều hướng cấp cao nhất có mục tiêu là nguồn gốc khác sẽ không được nâng cấp.

Ví dụ: giả sử tài liệu tại `https://example.org` được phục vụ với CSP chứa chỉ thị `upgrade-insecure-requests` và tài liệu chứa đánh dấu như thế này:

```html
<script src="http://example.org/my-cat.js"></script>
<script src="http://not-example.org/another-cat.js"></script>
```

Trình duyệt sẽ tự động nâng cấp cả hai yêu cầu này lên HTTPS.

Giả sử tài liệu cũng chứa điều này:

```html
<a href="http://example.org/more-cats">See some more cats!</a>
<a href="http://not-example.org/even-more-cats">More cats, on another site!</a>
```

Trình duyệt sẽ nâng cấp liên kết đầu tiên lên HTTPS, nhưng không nâng cấp liên kết thứ hai, vì nó điều hướng đến nguồn gốc khác.

Chỉ thị này không thay thế header {{httpheader("Strict-Transport-Security")}} (còn được gọi là HSTS), vì nó không nâng cấp các liên kết bên ngoài đến trang web. Các trang web nên bao gồm chỉ thị này và header `Strict-Transport-Security`.

## Yêu cầu trusted types

Các chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) và [`trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types) cho phép bạn bảo vệ chống lại các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) phía client, bằng cách đảm bảo rằng bất kỳ đầu vào nào đã được chuyển qua biến đổi để làm cho nó an toàn trước khi được truyền vào API nền tảng web có thể thực thi nó như code. Các chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) và [`trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types) có thể được sử dụng để thực thi [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API). Điều này cho phép bạn bảo vệ chống lại các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) phía client bằng cách bắt buộc bất kỳ đầu vào nào phải được chuyển qua hàm biến đổi, cung cấp cơ hội để làm cho nó an toàn trước khi được gửi đến API nền tảng web có thể thực thi nó như code.

### Injection sinks và sanitization

Một số API trong nền tảng web được biết đến là _injection sinks_. Đây là các API có thể nhận một số đầu vào, thường ở dạng chuỗi, và có thể diễn giải đầu vào đó như code. Trong hướng dẫn này, chúng ta đã thấy `eval()`, nhưng có nhiều injection sink khác, chẳng hạn như {{domxref("Element.innerHTML")}} hoặc {{domxref("Document.write()")}}.

Nếu kẻ tấn công có thể cung cấp một số đầu vào được tạo ra đặc biệt cho trang web của bạn và trang web của bạn chuyển nó vào một trong các injection sink này, thì kẻ tấn công có thể thực thi code độc hại.

Một số injection sink, như `eval()`, rất khó sử dụng an toàn và chúng ta đã thấy rằng CSP thường [chặn chúng hoàn toàn](#eval_and_similar_apis). Các sink khác có thể được làm an toàn hơn nếu đầu vào cho chúng được xử lý để xóa các phần tử không an toàn. Thực hành này được gọi là [_sanitization_](/en-US/docs/Web/Security/Attacks/XSS#sanitization).

### Trusted Types API

Với [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API), bạn có thể chuyển _trusted types_ vào injection sinks, thay vì chuỗi. Trusted types là các đối tượng kết quả từ việc chuyển đầu vào tiềm năng nguy hiểm qua hàm biến đổi. Biến đổi này thường làm sạch đầu vào, bằng cách xóa bất kỳ phần tử nào có thể làm cho nó có thể thực thi (chẳng hạn như thẻ {{htmlelement("script")}}).

Theo mặc định, code của bạn có thể chọn chuyển trusted types hoặc chuỗi không được làm sạch vào injection sinks. Tuy nhiên, nếu bạn bao gồm chỉ thị [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for) trong CSP của mình và cho nó giá trị `'script'`, thì trình duyệt chỉ cho phép trang web của bạn chuyển trusted types vào injection sinks. Ví dụ: code sau sẽ ném ngoại lệ:

```js example-bad
const possiblyXSS = "<p>I might be XSS</p>";
const target = document.querySelector("#target");

target.innerHTML = possiblyXSS;
// Will throw an exception if `require-trusted-types-for` is set
```

Các đối tượng trusted type được tạo bằng đối tượng _policy_ do người dùng xác định. Code của bạn có thể tạo bất kỳ loại đối tượng policy nào, bao gồm cả những đối tượng có hàm biến đổi thực sự không làm sạch đầu vào và do đó không bảo vệ bạn. Để giảm thiểu rủi ro này, bạn có thể bao gồm chỉ thị [`trusted-types`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/trusted-types). Điều này liệt kê tên các chính sách được chấp nhận và trình duyệt chỉ cho phép sử dụng những chính sách được đặt tên đó.

## Kiểm tra chính sách của bạn

Để dễ triển khai, CSP có thể được triển khai ở chế độ chỉ báo cáo. Chính sách không được thực thi, nhưng bất kỳ vi phạm nào đều được gửi đến endpoint báo cáo được chỉ định trong chính sách. Ngoài ra, một header chỉ báo cáo có thể được sử dụng để kiểm tra một bản sửa đổi tương lai của chính sách mà không thực sự triển khai nó.

Bạn có thể sử dụng header HTTP {{HTTPHeader("Content-Security-Policy-Report-Only")}} để chỉ định chính sách của mình, như thế này:

```http
Content-Security-Policy-Report-Only: policy
```

Nếu cả header {{HTTPHeader("Content-Security-Policy-Report-Only")}} và header {{HTTPHeader("Content-Security-Policy")}} đều có trong cùng một phản hồi, cả hai chính sách đều được tuân thủ. Chính sách được chỉ định trong header `Content-Security-Policy` được thực thi trong khi chính sách `Content-Security-Policy-Report-Only` tạo ra báo cáo nhưng không được thực thi.

Lưu ý rằng không giống như chính sách bảo mật nội dung thông thường, chính sách chỉ báo cáo không thể được gửi trong phần tử `<meta>`.

### Báo cáo vi phạm

Phương pháp được khuyến nghị để báo cáo vi phạm CSP là sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API), khai báo các endpoint trong {{HTTPHeader("Reporting-Endpoints")}} và chỉ định một trong số chúng làm mục tiêu báo cáo CSP bằng chỉ thị {{CSP("report-to")}} của header `Content-Security-Policy`.

> [!WARNING]
> Bạn cũng có thể sử dụng chỉ thị CSP {{CSP("report-uri")}} để chỉ định URL mục tiêu cho các báo cáo vi phạm CSP. Điều này gửi định dạng báo cáo JSON hơi khác thông qua thao tác `POST` với {{HTTPHeader("Content-Type")}} là `application/csp-report`. Cách tiếp cận này không còn được dùng nữa, nhưng bạn nên khai báo cả hai cho đến khi {{CSP("report-to")}} được hỗ trợ trong tất cả các trình duyệt. Để biết thêm thông tin về cách tiếp cận, xem chủ đề {{CSP("report-uri")}}.

Máy chủ có thể thông báo cho client nơi gửi báo cáo bằng header phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}}. Header này xác định một hoặc nhiều URL endpoint dưới dạng danh sách phân tách bằng dấu phẩy. Ví dụ: để xác định endpoint báo cáo có tên `csp-endpoint` chấp nhận báo cáo tại `https://example.com/csp-reports`, header phản hồi của máy chủ có thể trông như thế này:

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports"
```

Nếu bạn muốn có nhiều endpoint xử lý các loại báo cáo khác nhau, bạn sẽ chỉ định chúng như thế này:

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports",
                     hpkp-endpoint="https://example.com/hpkp-reports"
```

Sau đó bạn có thể sử dụng chỉ thị {{CSP("report-to")}} của header `Content-Security-Policy` để chỉ định rằng một endpoint được xác định cụ thể nên được sử dụng để báo cáo. Ví dụ: để gửi báo cáo vi phạm CSP đến `https://example.com/csp-reports` cho `default-src`, bạn có thể gửi các header phản hồi trông như sau:

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports"
Content-Security-Policy: default-src 'self'; report-to csp-endpoint
```

Khi vi phạm CSP xảy ra, trình duyệt gửi báo cáo dưới dạng đối tượng JSON đến endpoint được chỉ định thông qua thao tác HTTP {{httpmethod("POST")}}, với {{HTTPHeader("Content-Type")}} là `application/reports+json`. Báo cáo là dạng tuần tự hóa của đối tượng {{domxref("CSPViolationReport")}} chứa thuộc tính `type` với giá trị `"csp-violation"`.

Một đối tượng điển hình có thể trông như thế này:

```json
{
  "age": 53531,
  "body": {
    "blockedURL": "inline",
    "columnNumber": 39,
    "disposition": "enforce",
    "documentURL": "https://example.com/csp-report",
    "effectiveDirective": "script-src-elem",
    "lineNumber": 121,
    "originalPolicy": "default-src 'self'; report-to csp-endpoint-name",
    "referrer": "https://www.google.com/",
    "sample": "console.log(\"lo\")",
    "sourceFile": "https://example.com/csp-report",
    "statusCode": 200
  },
  "type": "csp-violation",
  "url": "https://example.com/csp-report",
  "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
}
```

Bạn cần thiết lập máy chủ để nhận báo cáo với định dạng JSON và loại nội dung đã cho. Máy chủ xử lý các yêu cầu này sau đó có thể lưu trữ hoặc xử lý các báo cáo đến theo cách phù hợp nhất với nhu cầu của bạn.

## Xem thêm

- [Lỗi và cảnh báo CSP](/en-US/docs/Web/HTTP/Guides/CSP/Errors)
- [Mitigate cross-site scripting with a strict Content Security Policy](https://web.dev/articles/strict-csp) trên web.dev (2024)
- [Content Security Policy: A successful mess between hardening and mitigation](https://infocondb.org/con/locomocosec/locomocosec-2019/content-security-policy-a-successful-mess-between-hardening-and-mitigation)
- [Content Security Policy Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Content_Security_Policy_Cheat_Sheet.html) trên owasp.org
- [CSP Evaluator](https://csp-evaluator.withgoogle.com/)

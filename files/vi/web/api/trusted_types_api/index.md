---
title: API Trusted Types
slug: Web/API/Trusted_Types_API
page-type: web-api-overview
browser-compat: api.trustedTypes
spec-urls: https://w3c.github.io/trusted-types/dist/spec/
---

{{DefaultAPISidebar("Trusted Types API")}}{{AvailableInWorkers}}

**API Trusted Types** cung cấp cho nhà phát triển web một cách để đảm bảo rằng dữ liệu đầu vào đã được truyền qua một hàm biến đổi do người dùng chỉ định trước khi được chuyển đến một API có thể thực thi dữ liệu đầu vào đó. Điều này giúp bảo vệ chống lại các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) phía client. Phổ biến nhất, hàm biến đổi sẽ [khử trùng](/en-US/docs/Web/Security/Attacks/XSS#sanitization) dữ liệu đầu vào.

## Các khái niệm và cách sử dụng

Các cuộc tấn công XSS phía client, hay còn gọi là XSS dựa trên DOM, xảy ra khi dữ liệu do kẻ tấn công tạo ra được chuyển đến một API của trình duyệt thực thi dữ liệu đó dưới dạng mã. Các API này được gọi là [_injection sinks_](#cac-interface injection-sink).

API Trusted Types phân biệt ba loại injection sinks:

- **HTML sinks**: Các API diễn giải dữ liệu đầu vào dưới dạng HTML, chẳng hạn như {{domxref("Element.innerHTML")}} hoặc {{domxref("Document.write()", "document.write()")}}. Các API này có thể thực thi JavaScript nếu nó được nhúng trong HTML, ví dụ trong các thẻ {{htmlelement("script")}} hoặc các thuộc tính trình xử lý sự kiện.
- **JavaScript sinks**: Các API diễn giải dữ liệu đầu vào dưới dạng JavaScript, chẳng hạn như {{jsxref("Global_Objects/eval", "eval()")}} hoặc {{domxref("HTMLScriptElement.text")}}.
- **JavaScript URL sinks**: Các API diễn giải dữ liệu đầu vào dưới dạng URL của một tập lệnh, chẳng hạn như {{domxref("HTMLScriptElement.src")}}.

Một trong những biện pháp phòng thủ chính chống lại các cuộc tấn công XSS dựa trên DOM là đảm bảo rằng dữ liệu đầu vào được làm an toàn trước khi chuyển đến injection sink.

Trong API Trusted Types, nhà phát triển định nghĩa một _đối tượng policy_, chứa các phương thức biến đổi dữ liệu đầu vào dành cho injection sink để làm cho nó an toàn. Policy có thể định nghĩa các phương thức khác nhau cho các loại sink khác nhau:

- Đối với HTML sinks, hàm biến đổi thường [khử trùng](/en-US/docs/Web/Security/Attacks/XSS#sanitization) dữ liệu đầu vào, ví dụ bằng cách sử dụng một thư viện như [DOMPurify](https://github.com/cure53/DOMPurify).
- Đối với JavaScript và JavaScript URL sinks, policy có thể tắt hoàn toàn các sinks hoặc cho phép một số dữ liệu đầu vào được xác định trước (ví dụ: các URL cụ thể).

API Trusted Types sau đó sẽ đảm bảo rằng dữ liệu đầu vào được truyền qua hàm biến đổi thích hợp trước khi được chuyển vào sink.

Nói cách khác, API cho phép bạn định nghĩa policy của mình ở một nơi và sau đó yên tâm rằng bất kỳ dữ liệu nào được chuyển đến injection sink đều đã được truyền qua policy.

> [!NOTE]
>
> Bản thân API Trusted Types _không_ cung cấp policy hay bất kỳ hàm biến đổi nào: nhà phát triển tự định nghĩa policy của mình, chứa các phép biến đổi mà họ muốn áp dụng.

API có hai phần chính:

- Một API JavaScript cho phép nhà phát triển khử trùng dữ liệu trước khi chuyển nó đến injection sink.
- Hai chỉ thị [CSP](/en-US/docs/Web/HTTP/Guides/CSP) thực thi và kiểm soát việc sử dụng API JavaScript.

### API JavaScript Trusted Types

Trong API Trusted Types:

- Thuộc tính toàn cục `trustedTypes`, khả dụng trong cả ngữ cảnh {{domxref("Window.trustedTypes", "Window")}} và {{domxref("WorkerGlobalScope.trustedTypes", "Worker")}}, được sử dụng để tạo các đối tượng {{domxref("TrustedTypePolicy")}}.
- Một đối tượng {{domxref("TrustedTypePolicy")}} được sử dụng để tạo các đối tượng trusted type: nó sẽ thực hiện việc này bằng cách truyền dữ liệu qua một hàm biến đổi.
- Các đối tượng trusted type đại diện cho dữ liệu đã đi qua policy, và do đó có thể được chuyển an toàn đến injection sink. Có ba loại trusted type, tương ứng với các loại injection sink khác nhau:
  - {{domxref("TrustedHTML")}} dùng để truyền đến một sink sẽ kết xuất dữ liệu dưới dạng HTML.
  - {{domxref("TrustedScript")}} dùng để truyền đến một sink sẽ thực thi dữ liệu dưới dạng JavaScript.
  - {{domxref("TrustedScriptURL")}} dùng để truyền đến một sink sẽ phân tích cú pháp dữ liệu dưới dạng URL đến một tập lệnh.

Với API này, thay vì truyền một chuỗi đến một injection sink như `innerHTML`, bạn sử dụng `TrustedTypePolicy` để tạo một đối tượng `TrustedHTML` từ chuỗi, sau đó truyền đối tượng đó vào sink, và có thể đảm bảo rằng chuỗi đã được truyền qua một hàm biến đổi.

Ví dụ: mã này tạo một `TrustedTypePolicy` có thể tạo các đối tượng `TrustedHTML` bằng cách khử trùng các chuỗi đầu vào với thư viện [DOMPurify](https://github.com/cure53/DOMPurify):

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

Tiếp theo, bạn có thể sử dụng đối tượng `policy` này để tạo một đối tượng `TrustedHTML`, và truyền đối tượng đó vào injection sink:

```js
const userInput = "<p>I might be XSS</p>";
const element = document.querySelector("#container");

const trustedHTML = policy.createHTML(userInput);
element.innerHTML = trustedHTML;
```

### Sử dụng CSP để thực thi trusted types

API được mô tả ở trên cho phép bạn khử trùng dữ liệu, nhưng nó không đảm bảo rằng mã của bạn không bao giờ truyền dữ liệu đầu vào trực tiếp đến injection sink: nghĩa là, nó không ngăn bạn truyền một chuỗi vào `innerHTML`.

Để thực thi việc bắt buộc phải truyền một trusted type, bạn bao gồm chỉ thị {{CSP("require-trusted-types-for")}} trong [CSP](/en-US/docs/Web/HTTP/Guides/CSP) của bạn.
Khi chỉ thị này được đặt, việc truyền chuỗi vào injection sinks sẽ dẫn đến một ngoại lệ `TypeError`:

```js example-bad
const userInput = "<p>I might be XSS</p>";
const element = document.querySelector("#container");

element.innerHTML = userInput; // Ném ra một TypeError
```

Ngoài ra, chỉ thị CSP {{CSP("trusted-types")}} có thể được sử dụng để kiểm soát những policy nào mà mã của bạn được phép tạo. Khi bạn tạo một policy bằng {{domxref("TrustedTypePolicyFactory/createPolicy", "trustedTypes.createPolicy()")}}, bạn truyền một tên cho policy. Chỉ thị CSP `trusted-types` liệt kê các tên policy được chấp nhận, vì vậy `createPolicy()` sẽ ném ra một ngoại lệ nếu nó được truyền một tên không được liệt kê trong `trusted-types`. Điều này ngăn một số mã trong ứng dụng web của bạn tạo ra một policy mà bạn không mong đợi.

### Policy mặc định

Trong API Trusted Types, bạn có thể định nghĩa một _policy mặc định_. Điều này giúp bạn tìm ra bất kỳ vị trí nào trong mã nơi bạn vẫn đang truyền chuỗi vào injection sinks, để bạn có thể viết lại mã nhằm tạo và truyền trusted types thay thế.

Nếu bạn tạo một policy có tên `"default"` và CSP của bạn thực thi việc sử dụng trusted types, thì bất kỳ đối số chuỗi nào được truyền vào injection sinks sẽ tự động được truyền đến policy này. Ví dụ: giả sử chúng ta tạo một policy như sau:

```js
trustedTypes.createPolicy("default", {
  createHTML(value) {
    console.log("Vui lòng tái cấu trúc mã này");
    return sanitize(value);
  },
});
```

Với policy này, nếu mã của bạn gán một chuỗi cho `innerHTML`, trình duyệt sẽ gọi phương thức `createHTML()` của policy và gán kết quả của nó cho sink:

```js
const userInput = "<p>I might be XSS</p>";
const element = document.querySelector("#container");

element.innerHTML = userInput;
// Ghi nhật ký "Vui lòng tái cấu trúc mã này"
// Gán kết quả của sanitize(userInput)
```

Nếu policy mặc định trả về `null` hoặc `undefined`, thì trình duyệt sẽ ném ra một `TypeError` khi gán kết quả cho sink:

```js
trustedTypes.createPolicy("default", {
  createHTML(value) {
    console.log("Vui lòng tái cấu trúc mã này");
    return null;
  },
});

const userInput = "<p>I might be XSS</p>";
const element = document.querySelector("#container");

element.innerHTML = userInput;
// Ghi nhật ký "Vui lòng tái cấu trúc mã này"
// Ném ra một TypeError
```

> [!NOTE]
> Bạn nên sử dụng policy mặc định chỉ khi bạn đang chuyển đổi từ mã legacy truyền dữ liệu đầu vào trực tiếp đến injection sinks, sang mã sử dụng trusted types một cách tường minh.

### Các interface injection sink

Phần này cung cấp danh sách các interface injection sink "trực tiếp".

Đây là các thuộc tính và phương thức API thực hiện kiểm tra trusted type khi chúng được đánh giá.
Chúng có thể được truyền trusted types (`TrustedHTML`, `TrustedScript` hoặc `TrustedScriptURL`) cũng như chuỗi, và phải được truyền trusted types khi việc thực thi trusted type được bật và không có policy mặc định nào được định nghĩa.

#### TrustedHTML

- {{domxref("Document.execCommand()")}} với `commandName` là [`"insertHTML"`](/en-US/docs/Web/API/Document/execCommand#inserthtml)
- {{domxref("Document.parseHTMLUnsafe_static", "Document.parseHTMLUnsafe()")}}
- {{domxref("Document.write()")}}
- {{domxref("Document.writeln()")}}
- {{domxref("DOMParser.parseFromString()")}}
- {{domxref("Element.innerHTML")}}
- {{domxref("Element.insertAdjacentHTML")}}
- {{domxref("Element.outerHTML")}}
- {{domxref("Element.setHTMLUnsafe()")}}
- {{domxref("HTMLIFrameElement.srcdoc")}}
- {{domxref("Range.createContextualFragment()")}}
- {{domxref("ShadowRoot.innerHTML")}}
- {{domxref("ShadowRoot.setHTMLUnsafe()")}}

#### TrustedScript

- [Hàm khởi tạo `AsyncFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncFunction/AsyncFunction)
- [Hàm khởi tạo `AsyncGeneratorFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncGeneratorFunction/AsyncGeneratorFunction)
- {{jsxref("Global_Objects/eval", "eval()")}}
- [`Element.setAttribute()`](/en-US/docs/Web/API/Element/setAttribute#value) (đối số `value`)
- [`Element.setAttributeNS()`](/en-US/docs/Web/API/Element/setAttributeNS#value) (đối số `value`)
- [Hàm khởi tạo `Function()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/Function)
- [Hàm khởi tạo `GeneratorFunction()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/GeneratorFunction/GeneratorFunction)
- {{domxref("HTMLScriptElement.innerText")}}
- {{domxref("HTMLScriptElement.textContent")}}
- {{domxref("HTMLScriptElement.text")}}
- [`window.setTimeout()`](/en-US/docs/Web/API/Window/setTimeout#code) và [`WorkerGlobalScope.setTimeout()`](/en-US/docs/Web/API/WorkerGlobalScope/setTimeout#code) (đối số `code`)
- [`window.setInterval()`](/en-US/docs/Web/API/Window/setInterval#code) và [`WorkerGlobalScope.setInterval()`](/en-US/docs/Web/API/WorkerGlobalScope/setInterval#code) (đối số `code`)

#### TrustedScriptURL

- {{domxref("HTMLScriptElement.src")}}
- {{domxref("ServiceWorkerContainer.register()")}}
- {{domxref("SvgAnimatedString.baseVal")}}
- {{domxref("WorkerGlobalScope.importScripts()")}}
- Đối số `url` của [hàm khởi tạo `Worker()`](/en-US/docs/Web/API/Worker/Worker#url)
- Đối số `url` của [hàm khởi tạo `SharedWorker()`](/en-US/docs/Web/API/SharedWorker/SharedWorker#url)

### Injection sinks gián tiếp

_Injection sinks gián tiếp_ là các sinks nơi các chuỗi không đáng tin cậy được tiêm vào DOM thông qua một cơ chế trung gian không chấp nhận hoặc không thực thi trusted types.
Chúng khác với các [interface injection sink](#cac-interface-injection-sink) "trực tiếp" được liệt kê trong phần trước, vốn chạy kiểm tra trusted type trên các chuỗi được tiêm khi chúng được gọi.

Ví dụ: đoạn mã sau đặt nguồn phần tử tập lệnh một cách gián tiếp.
Đầu tiên một {{htmlelement("text")}} được tạo bằng cách sử dụng một chuỗi do người dùng cung cấp, và sau đó một phần tử {{htmlelement("script")}} được tạo và {{htmlelement("text")}} được thêm vào làm phần tử con.
Tiếp theo phần tử tập lệnh được thêm vào tài liệu dưới dạng phần tử con của phần tử {{htmlelement("body")}} — tại thời điểm này các tập lệnh được định nghĩa trong chuỗi ban đầu có thể được thực thi.

```js
// Tạo một nút văn bản
const untrustedString =
  "console.log('Một tập lệnh có khả năng độc hại từ nguồn không đáng tin cậy!');";
const textNode = document.createTextNode(untrustedString);

// Tạo một phần tử script và thêm nút văn bản
const script = document.createElement("script");
script.appendChild(textNode);

// Thêm script vào tài liệu, nơi nó có thể chạy
document.body.appendChild(script);
```

Khi {{htmlelement("text")}} được tạo, không có lý do gì để trình duyệt giả sử rằng nó được dự định sử dụng làm nguồn trusted type, vì vậy trusted types được tuần tự hóa thành chuỗi và không được thực thi.

Thay vào đó, trình duyệt chạy kiểm tra khi phần tử tập lệnh trở nên có thể thực thi — tức là, trong ví dụ này, khi `document.body.appendChild(script)` được gọi để thêm phần tử tập lệnh vào tài liệu.

Trình duyệt trước tiên sẽ kiểm tra xem chuỗi được sử dụng làm nội dung tập lệnh có đáng tin cậy không.
Bất kỳ hoạt động nào cho phép sửa đổi nguồn văn bản của {{htmlelement("script")}} mà không đặt {{domxref("TrustedScript")}} một cách tường minh sẽ làm cho nó không đáng tin cậy.
Phương thức {{domxref("Node.appendChild()")}} được sử dụng ở trên chỉ là một ví dụ (một số phương thức khác được liệt kê trong các bài kiểm tra WPT Live tại <https://wpt.live/trusted-types/script-enforcement-001.html>).

Nếu chuỗi không đáng tin cậy và trusted types được thực thi, trình duyệt sẽ cố gắng lấy một `TrustedScript` từ một [policy mặc định](#policy-mac-dinh) để sử dụng cho nguồn thay thế.
Nếu policy mặc định không được định nghĩa, hoặc không trả về một `TrustedScript`, hoạt động sẽ ném ra một ngoại lệ.

### Hỗ trợ đa trình duyệt cho trusted types

API Trusted Types chưa khả dụng trong tất cả các trình duyệt hiện đại, nhưng nó có thể sử dụng được ở mọi nơi hiện nay nhờ [các công cụ tương thích do W3C tạo](https://github.com/w3c/trusted-types/tree/main?tab=readme-ov-file#polyfill).

- [_full_ polyfill](https://github.com/w3c/trusted-types/blob/main/src/polyfill/full.js) định nghĩa API JavaScript, cố gắng suy ra CSP từ tài liệu hiện tại và thực thi việc sử dụng trusted types dựa trên CSP được suy ra.
- [_API only_ polyfill](https://github.com/w3c/trusted-types/blob/main/src/polyfill/api_only.js) chỉ định nghĩa API JavaScript và không bao gồm khả năng thực thi việc sử dụng trusted types bằng CSP.

Ngoài hai polyfills này, W3C cung cấp thứ mà họ gọi là _tinyfill_, chúng ta sẽ giải thích chi tiết hơn bên dưới.

Lưu ý rằng miễn là bạn đã kiểm tra mã của mình trên một trình duyệt hỗ trợ với việc thực thi CSP được bật, thì bạn không cần sử dụng _full polyfill_ ở trên trên các trình duyệt khác — bạn có thể nhận được các lợi ích tương tự bằng cách sử dụng _API only polyfill_ hoặc _tinyfill_.

Điều này là do việc thực thi buộc bạn phải tái cấu trúc mã của mình để đảm bảo rằng tất cả dữ liệu được truyền qua API Trusted Types (và do đó đã đi qua một hàm khử trùng) trước khi được truyền đến injection sink.
Nếu bạn sau đó chạy mã đã tái cấu trúc trong một trình duyệt khác mà không có thực thi, nó vẫn sẽ đi qua các đường dẫn mã tương tự và cung cấp cho bạn sự bảo vệ tương tự.

#### Trusted Types tinyfill

Trong phần này, chúng ta sẽ xem cách trusted types tinyfill có thể bảo vệ một trang web, mặc dù nó hoàn toàn không thêm hỗ trợ cho trusted types.

Trusted types tinyfill chỉ là:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Nó cung cấp một triển khai của `trustedTypes.createPolicy()` chỉ trả về đối tượng [`policyOptions`](/en-US/docs/Web/API/TrustedTypePolicyFactory/createPolicy#policyoptions) mà nó được truyền. Đối tượng `policyOptions` định nghĩa các hàm khử trùng cho dữ liệu và các hàm này được mong đợi sẽ trả về chuỗi.

Với tinyfill này, giả sử chúng ta tạo một policy:

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

Trong các trình duyệt hỗ trợ trusted types, điều này sẽ trả về một `TrustedTypePolicy` sẽ tạo một đối tượng `TrustedHTML` khi chúng ta gọi `policy.createHTML()`. Đối tượng `TrustedHTML` sau đó có thể được truyền đến một injection sink và chúng ta có thể thực thi rằng sink nhận được một trusted type, thay vì một chuỗi.

Trong các trình duyệt không hỗ trợ trusted types, đoạn mã này sẽ trả về một đối tượng có hàm `createHTML()` khử trùng dữ liệu đầu vào và trả về dưới dạng chuỗi. Chuỗi đã khử trùng sau đó có thể được truyền đến một injection sink.

```js
const userInput = "I might be XSS";
const element = document.querySelector("#container");

const trustedHTML = policy.createHTML(userInput);
// Trong các trình duyệt hỗ trợ, trustedHTML là một đối tượng TrustedHTML.
// Trong các trình duyệt không hỗ trợ, trustedHTML là một chuỗi.

element.innerHTML = trustedHTML;
// Trong các trình duyệt hỗ trợ, điều này sẽ ném lỗi nếu trustedHTML
// không phải là một đối tượng TrustedHTML.
```

Dù bằng cách nào, injection sink đều nhận được dữ liệu đã khử trùng, và bởi vì chúng ta có thể thực thi việc sử dụng policy trong trình duyệt hỗ trợ, chúng ta biết rằng đường dẫn mã này đi qua hàm khử trùng trong trình duyệt không hỗ trợ, too.

## Các interface

- {{domxref("TrustedHTML")}}
  - : Đại diện cho một chuỗi để chèn vào một injection sink sẽ kết xuất nó dưới dạng HTML.
- {{domxref("TrustedScript")}}
  - : Đại diện cho một chuỗi để chèn vào một injection sink có thể dẫn đến việc tập lệnh được thực thi.
- {{domxref("TrustedScriptURL")}}
  - : Đại diện cho một chuỗi để chèn vào một injection sink sẽ phân tích cú pháp nó dưới dạng URL của một tài nguyên tập lệnh bên ngoài.
- {{domxref("TrustedTypePolicy")}}
  - : Định nghĩa các hàm được sử dụng để tạo các đối tượng Trusted Type ở trên.
- {{domxref("TrustedTypePolicyFactory")}}
  - : Tạo các policy và xác minh rằng các instance đối tượng Trusted Type được tạo thông qua một trong các policy.

### Mở rộng cho các interface khác

- {{domxref("Window.trustedTypes")}}
  - : Trả về đối tượng {{domxref("TrustedTypePolicyFactory")}} được liên kết với đối tượng toàn cục trong luồng chính.
    Đây là điểm nhập để sử dụng API trong luồng Window.
- {{domxref("WorkerGlobalScope.trustedTypes")}}.
  - : Trả về đối tượng {{domxref("TrustedTypePolicyFactory")}} được liên kết với đối tượng toàn cục trong một worker.

### Mở rộng cho HTTP

#### Các chỉ thị `Content-Security-Policy`

- {{CSP("require-trusted-types-for")}}
  - : Thực thi việc Trusted Types được truyền đến các [injection sinks](#cac-khai-niem-va-cach-su-dung) XSS DOM.
- {{CSP("trusted-types")}}
  - : Được sử dụng để chỉ định một danh sách cho phép các tên policy Trusted Types.

#### Các từ khóa `Content-Security-Policy`

- [`trusted-types-eval`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#trusted-types-eval)
  - : Cho phép [`eval()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/eval) và các hàm tương tự được sử dụng nhưng chỉ khi Trusted Types được hỗ trợ và thực thi.

## Ví dụ

Trong ví dụ bên dưới, chúng ta tạo một policy sẽ tạo các đối tượng {{domxref("TrustedHTML")}} bằng cách sử dụng {{domxref("TrustedTypePolicyFactory.createPolicy()")}}. Sau đó chúng ta có thể sử dụng {{domxref("TrustedTypePolicy.createHTML()")}} để tạo một chuỗi HTML đã khử trùng để được chèn vào tài liệu.

Giá trị đã khử trùng sau đó có thể được sử dụng với {{domxref("Element.innerHTML")}} để đảm bảo rằng không có phần tử HTML mới nào có thể được tiêm vào.

```html
<div id="myDiv"></div>
```

```js
const escapeHTMLPolicy = trustedTypes.createPolicy("myEscapePolicy", {
  createHTML: (string) =>
    string
      .replace(/&/g, "&amp;")
      .replace(/</g, "&lt;")
      .replace(/"/g, "&quot;")
      .replace(/'/g, "&apos;"),
});

let el = document.getElementById("myDiv");
const escaped = escapeHTMLPolicy.createHTML("<img src=x onerror=alert(1)>");
console.log(escaped instanceof TrustedHTML); // true
el.innerHTML = escaped;
```

Tìm hiểu thêm về ví dụ này và khám phá các cách khác để khử trùng dữ liệu đầu vào trong bài viết [Ngăn chặn các lỗ hổng cross-site scripting dựa trên DOM với Trusted Types](https://web.dev/articles/trusted-types).

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Ngăn chặn các lỗ hổng cross-site scripting dựa trên DOM với Trusted Types](https://web.dev/articles/trusted-types)
- [Polyfill Trusted Types](https://github.com/w3c/trusted-types#polyfill) (cũng có sẵn dưới dạng [gói npm](https://www.npmjs.com/package/trusted-types))

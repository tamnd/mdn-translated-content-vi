---
title: HTML Sanitizer API
slug: Web/API/HTML_Sanitizer_API
page-type: web-api-overview
browser-compat: api.Sanitizer
---

{{DefaultAPISidebar("HTML Sanitizer API")}}

**HTML Sanitizer API** cho phép các nhà phát triển lấy các chuỗi HTML và lọc bỏ các phần tử, thuộc tính và các thực thể HTML không mong muốn khi chúng được chèn vào DOM hoặc shadow DOM.

## Khái niệm và cách sử dụng

Các ứng dụng web thường cần làm việc với HTML không đáng tin cậy ở phía client, ví dụ như một phần của giải pháp tạo mẫu phía client, khi hiển thị nội dung do người dùng tạo ra, hoặc khi bao gồm dữ liệu trong khung từ trang web khác.

Việc chèn HTML không đáng tin cậy có thể khiến trang web dễ bị tấn công bởi [nhiều loại tấn công](/en-US/docs/Web/Security/Attacks). Đặc biệt, [tấn công cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) hoạt động bằng cách chèn HTML không đáng tin cậy vào DOM, sau đó thực thi JavaScript trong ngữ cảnh của nguồn gốc hiện tại, cho phép mã độc hại chạy như thể nó được phục vụ từ nguồn gốc của trang web. Các cuộc tấn công này có thể được giảm thiểu bằng cách xóa các phần tử và thuộc tính HTML không an toàn trước khi chúng được chèn vào DOM.

HTML Sanitizer API cung cấp một số phương thức để xóa các thực thể HTML không mong muốn khỏi đầu vào HTML trước khi nó được chèn vào DOM. Chúng có các phiên bản an toàn với XSS bắt buộc xóa tất cả các phần tử và thuộc tính không an toàn, và các phiên bản có thể không an toàn cho phép các nhà phát triển kiểm soát hoàn toàn các thực thể HTML được phép.

### Phương thức làm sạch

HTML Sanitizer API cung cấp các phương thức an toàn và không an toàn với XSS để chèn các chuỗi HTML vào {{domxref('Element')}} hoặc {{domxref('ShadowRoot')}}, và để phân tích HTML thành {{domxref('Document')}}.

- Phương thức an toàn
  - : {{domxref('Element.setHTML()')}}, {{domxref('ShadowRoot.setHTML()')}}, và {{domxref('Document/parseHTML_static','Document.parseHTML()')}}.
- Phương thức không an toàn
  - : {{domxref('Element.setHTMLUnsafe()')}}, {{domxref('ShadowRoot.setHTMLUnsafe()')}}, và {{domxref('Document/parseHTMLUnsafe_static','Document.parseHTMLUnsafe()')}}.

Tất cả các phương thức nhận HTML cần chèn và một {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}} tùy chọn làm đối số. Đối tượng sanitizer định nghĩa các thực thể HTML sẽ bị lọc khỏi đầu vào trước khi nó được chèn vào. Các phương thức {{domxref('Element')}} nhận biết ngữ cảnh, và sẽ loại bỏ thêm bất kỳ phần tử nào mà đặc tả HTML không cho phép trong phần tử đích.

Các phương thức an toàn luôn xóa các phần tử và thuộc tính không an toàn với XSS. Nếu không có sanitizer nào được truyền làm tham số, chúng sẽ sử dụng [cấu hình sanitizer mặc định](#default_sanitizer_configuration), xóa cả các phần tử và thuộc tính không an toàn với XSS, chẳng hạn như các phần tử {{htmlelement("script")}} và trình xử lý sự kiện `onclick`, cùng với những thứ khác có thể được sử dụng trong các loại tấn công khác nếu được cung cấp làm đầu vào người dùng.

Các phương thức an toàn nên được sử dụng thay cho {{domxref("Element.innerHTML")}}, {{domxref("Element.outerHTML")}}, hoặc {{domxref("ShadowRoot.innerHTML")}}, để chèn nội dung HTML không đáng tin cậy.

Các phương thức không an toàn với XSS sẽ sử dụng bất kỳ cấu hình sanitizer nào được truyền làm đối số. Nếu không có sanitizer nào được truyền, thì tất cả các phần tử và thuộc tính HTML được phép theo ngữ cảnh sẽ được chèn vào.

### Cấu hình sanitizer

Cấu hình sanitizer định nghĩa những thực thể HTML nào sẽ được phép, thay thế hoặc xóa khi sanitizer được sử dụng, bao gồm các phần tử, thuộc tính, thuộc tính `data-*`, và nhận xét.

Có hai cơ chế để định nghĩa cấu hình sanitizer:

- {{domxref('SanitizerConfig')}} là đối tượng từ điển định nghĩa các mảng cho các phần tử và thuộc tính được phép/không được phép và các thuộc tính boolean.

- {{domxref('Sanitizer')}} về cơ bản là bộ bọc xung quanh {{domxref('SanitizerConfig')}} cung cấp các phương thức để sửa đổi cấu hình một cách thuận tiện và đảm bảo nó vẫn hợp lệ.

#### Cấu hình cho phép và xóa

Bạn có thể xây dựng cấu hình theo hai cách:

- Là _cấu hình cho phép_: chỉ định tập hợp các phần tử và/hoặc thuộc tính bạn sẽ cho phép trong đầu ra.
- Là _cấu hình xóa_: chỉ định tập hợp không được có trong đầu ra.

#### Các cấu hình tích hợp sẵn

Cấu hình cơ sở an toàn với XSS định nghĩa các mục phải bị xóa khỏi đầu vào để làm cho nó an toàn với XSS:

- {{htmlelement("embed")}}, {{htmlelement("frame")}}, {{htmlelement("iframe")}}, {{htmlelement("object")}}, {{htmlelement("script")}}, và {{SVGElement("use")}}.
- Tất cả các thuộc tính nội dung trình xử lý sự kiện, chẳng hạn như `onafterprint`, `onbeforeinput`, v.v.

Cấu hình mặc định hạn chế hơn cấu hình cơ sở an toàn với XSS và là cấu hình được sử dụng nếu bạn gọi {{domxref("Element.setHTML()")}} hoặc các [phương thức làm sạch an toàn](#sanitization_methods) khác mà không truyền đối tượng sanitizer.

### Làm sạch và Trusted Types

[Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API) cung cấp cơ chế để đảm bảo đầu vào được đưa qua hàm chuyển đổi do người dùng chỉ định trước khi được truyền vào API có thể thực thi đầu vào đó.

Các phương thức làm sạch HTML an toàn không sử dụng trusted types. Vì chúng luôn lọc tất cả các thực thể không an toàn với XSS trước khi HTML đầu vào được chèn vào, không cần phải làm sạch chuỗi đầu vào.

Tuy nhiên các phương thức làm sạch HTML không an toàn có thể chèn HTML không đáng tin cậy tùy thuộc vào sanitizer, và do đó sẽ hoạt động với trusted types.

## Giao diện

- {{domxref('Sanitizer')}}
  - : Đối tượng cấu hình sanitizer có thể tái sử dụng định nghĩa những phần tử và thuộc tính nào nên được phép/xóa khi làm sạch các chuỗi HTML không đáng tin cậy.
- {{domxref('SanitizerConfig')}}
  - : Từ điển định nghĩa cấu hình sanitizer. Có thể được sử dụng ở những nơi tương tự như {{domxref('Sanitizer')}} nhưng có thể kém hiệu quả hơn khi sử dụng và tái sử dụng.

## Phần mở rộng cho các giao diện khác

### Phương thức an toàn với XSS

- {{domxref('Element.setHTML()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút, loại bỏ bất kỳ phần tử nào không hợp lệ trong ngữ cảnh của phần tử. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép bởi cấu hình sanitizer, và bất kỳ cái nào được coi là không an toàn với XSS. Cây con sau đó được chèn vào DOM như cây con của phần tử.
- {{domxref('ShadowRoot.setHTML()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép bởi cấu hình sanitizer và bất kỳ cái nào không an toàn với XSS. Cây con sau đó được chèn như cây con của `ShadowRoot`.
- {{domxref('Document/parseHTML_static','Document.parseHTML()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép và bất kỳ cái nào không an toàn với XSS. Cây con sau đó được đặt làm gốc của {{domxref("Document")}}.

### Phương thức không an toàn với XSS

- {{domxref('Element.setHTMLUnsafe()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút, loại bỏ bất kỳ phần tử nào không hợp lệ trong ngữ cảnh của phần tử. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép bởi sanitizer: nếu không có sanitizer nào được chỉ định, cho phép tất cả phần tử. Cây con sau đó được chèn vào DOM.
- {{domxref('ShadowRoot.setHTMLUnsafe()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép bởi sanitizer: nếu không có sanitizer nào được chỉ định, cho phép tất cả phần tử. Cây con sau đó được chèn vào `ShadowRoot`.
- {{domxref('Document/parseHTMLUnsafe_static','Document.parseHTMLUnsafe()')}}
  - : Phân tích chuỗi HTML thành cây con của các nút. Sau đó loại bỏ bất kỳ phần tử và thuộc tính nào không được phép bởi sanitizer: nếu không có sanitizer nào được chỉ định, cho phép tất cả phần tử. Cây con sau đó được đặt làm gốc của {{domxref("Document")}}.

## Ví dụ

Các ví dụ sau đây cho thấy cách sử dụng Sanitizer API bằng sanitizer _mặc định_.

### Sử dụng `Element.setHTML()` với sanitizer mặc định

Trong hầu hết các trường hợp, gọi `Element.setHTML()` mà không truyền sanitizer có thể được sử dụng như thay thế trực tiếp cho {{domxref("Element.innerHTML")}}.

```js
const untrustedString = "abc <script>alert(1)<" + "/script> def"; // Untrusted HTML (perhaps from user input)
const someTargetElement = document.getElementById("target");

// someElement.innerHTML = untrustedString;
someElement.setHTML(untrustedString);

console.log(target.innerHTML); // abc def
```

Phần tử `{{htmlelement("script")}}` không được phép bởi sanitizer mặc định, hoặc bởi phương thức `setHTML()`, vì vậy `alert()` bị xóa.

### Sử dụng cấu hình sanitizer cho phép

Đoạn mã này cho thấy cách bạn có thể sử dụng `Element.setHTMLUnsafe()` với sanitizer cho phép chỉ cho phép {{htmlelement("p")}}, {{htmlelement("b")}}, và {{htmlelement("div")}}. Tất cả các phần tử khác trong chuỗi đầu vào sẽ bị xóa.

```js
const sanitizer = new Sanitizer({ elements: ["p", "b", "div"] });
someElement.setHTMLUnsafe(untrustedString, { sanitizer });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

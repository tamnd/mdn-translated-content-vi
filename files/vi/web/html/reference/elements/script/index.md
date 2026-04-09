---
title: "<script>: The Script element"
slug: Web/HTML/Reference/Elements/script
page-type: html-element
browser-compat: html.elements.script
sidebar: htmlsidebar
---

Phần tử **`<script>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để nhúng code hoặc dữ liệu có thể thực thi; điều này thường được dùng để nhúng hoặc tham chiếu đến code JavaScript. Phần tử `<script>` cũng có thể được dùng với các ngôn ngữ khác, chẳng hạn như ngôn ngữ lập trình shader GLSL của [WebGL](/en-US/docs/Web/API/WebGL_API) và [JSON](/en-US/docs/Glossary/JSON).

## Thuộc tính

Phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `async`
  - : Đối với các classic script, nếu thuộc tính `async` có mặt, thì classic script sẽ được tải xuống song song với quá trình phân tích cú pháp và được đánh giá ngay khi có sẵn.

    Đối với [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules), nếu thuộc tính `async` có mặt, thì các script và tất cả phụ thuộc của chúng sẽ được tải xuống song song với quá trình phân tích cú pháp và được đánh giá ngay khi có sẵn.

    > [!WARNING]
    > Thuộc tính này không được sử dụng nếu thuộc tính `src` vắng mặt (tức là đối với inline script) cho classic script, trong trường hợp đó nó sẽ không có tác dụng.

    Thuộc tính này cho phép loại bỏ **JavaScript chặn parser** khi trình duyệt phải tải và đánh giá các script trước khi tiếp tục phân tích cú pháp. `defer` có tác dụng tương tự trong trường hợp này.

    Nếu thuộc tính được chỉ định cùng với thuộc tính `defer`, phần tử sẽ hoạt động như thể chỉ có thuộc tính `async` được chỉ định.

    Đây là một thuộc tính boolean: sự hiện diện của thuộc tính boolean trên một phần tử đại diện cho giá trị true, và sự vắng mặt của thuộc tính đại diện cho giá trị false.

    Xem [Khả năng tương thích với trình duyệt](#browser_compatibility) để biết ghi chú về hỗ trợ trình duyệt. Xem thêm [Async scripts for asm.js](/en-US/docs/Games/Techniques/Async_scripts).

- `attributionsrc` {{deprecated_inline}}
  - : Chỉ định rằng bạn muốn trình duyệt gửi header {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu tài nguyên script. Về phía máy chủ, điều này được dùng để kích hoạt việc gửi header {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} trong phản hồi, để đăng ký [attribution source](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#javascript-based_event_sources) hoặc [attribution trigger](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#javascript-based_attribution_triggers) dựa trên JavaScript, tương ứng. Header phản hồi nào cần gửi lại phụ thuộc vào giá trị của header `Attribution-Reporting-Eligible` đã kích hoạt việc đăng ký.

    > [!NOTE]
    > Ngoài ra, các attribution source hoặc trigger dựa trên JavaScript có thể được đăng ký bằng cách gửi yêu cầu {{domxref("Window/fetch", "fetch()")}} chứa tùy chọn `attributionReporting` (đặt trực tiếp trên lệnh gọi `fetch()` hoặc trên đối tượng {{domxref("Request")}} được truyền vào lệnh gọi `fetch()`), hoặc bằng cách gửi {{domxref("XMLHttpRequest")}} với {{domxref("XMLHttpRequest.setAttributionReporting", "setAttributionReporting()")}} được gọi trên đối tượng yêu cầu.

    Có hai phiên bản của thuộc tính này mà bạn có thể đặt:
    - Boolean, tức là chỉ tên `attributionsrc`. Điều này chỉ định rằng bạn muốn header {{httpheader("Attribution-Reporting-Eligible")}} được gửi đến cùng máy chủ mà thuộc tính `src` trỏ đến. Điều này ổn khi bạn xử lý đăng ký attribution source hoặc trigger trên cùng một máy chủ. Khi đăng ký attribution trigger, thuộc tính này là tùy chọn, và giá trị chuỗi rỗng sẽ được dùng nếu bị bỏ qua.
    - Giá trị chứa một hoặc nhiều URL, ví dụ:

      ```html
      <script
        src="myscript.js"
        attributionsrc="https://a.example/register-source https://b.example/register-source"></script>
      ```

      Điều này hữu ích trong các trường hợp tài nguyên được yêu cầu không nằm trên máy chủ bạn kiểm soát, hoặc bạn chỉ muốn xử lý việc đăng ký attribution source trên một máy chủ khác. Trong trường hợp này, bạn có thể chỉ định một hoặc nhiều URL làm giá trị của `attributionsrc`. Khi yêu cầu tài nguyên xảy ra, header {{httpheader("Attribution-Reporting-Eligible")}} sẽ được gửi đến (các) URL được chỉ định trong `attributionSrc` ngoài nguồn gốc tài nguyên. Các URL này sau đó có thể phản hồi bằng header {{httpheader("Attribution-Reporting-Register-Source")}} hoặc {{httpheader("Attribution-Reporting-Register-Trigger")}} tùy theo để hoàn tất việc đăng ký.

      > [!NOTE]
      > Chỉ định nhiều URL có nghĩa là nhiều attribution source có thể được đăng ký trên cùng một tính năng. Ví dụ, bạn có thể có các chiến dịch khác nhau mà bạn đang cố đo lường mức độ thành công, liên quan đến việc tạo ra các báo cáo khác nhau trên các dữ liệu khác nhau.

    Xem [Attribution Reporting API](/en-US/docs/Web/API/Attribution_Reporting_API) để biết thêm chi tiết.

- `blocking`
  - : Thuộc tính này chỉ định rõ ràng rằng một số thao tác nhất định cần bị chặn cho đến khi script được thực thi. Các thao tác cần bị chặn phải là danh sách các token chặn được phân tách bằng dấu cách. Hiện tại chỉ có một token:
    - `render`: Việc hiển thị nội dung trên màn hình bị chặn.

    > [!NOTE]
    > Chỉ các phần tử `script` trong `<head>` của tài liệu mới có thể chặn hiển thị. Các script không chặn hiển thị theo mặc định; nếu một phần tử `script` không bao gồm `type="module"`, `async`, hoặc `defer`, thì nó chặn _phân tích cú pháp_, không phải _hiển thị_. Nếu phần tử `script` như vậy được thêm động thông qua script, bạn phải đặt `blocking = "render"` để nó chặn hiển thị.

- [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin)
  - : Các phần tử `script` bình thường truyền thông tin tối thiểu đến {{domxref('Window.error_event', 'window.onerror')}} cho các script không vượt qua kiểm tra {{Glossary("CORS")}} tiêu chuẩn. Để cho phép ghi nhật ký lỗi cho các trang web sử dụng một tên miền riêng cho nội dung đa phương tiện tĩnh, hãy sử dụng thuộc tính này. Xem [Thuộc tính cài đặt CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) để biết giải thích mô tả hơn về các đối số hợp lệ của nó.
- `defer`
  - : Thuộc tính Boolean này được đặt để chỉ cho trình duyệt biết rằng script sẽ được thực thi sau khi tài liệu được phân tích cú pháp xong, nhưng trước khi kích hoạt sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}}.

    Các script có thuộc tính `defer` sẽ ngăn sự kiện `DOMContentLoaded` kích hoạt cho đến khi script đã tải xong và đánh giá xong.

    > [!WARNING]
    > Thuộc tính này không được sử dụng nếu thuộc tính `src` vắng mặt (tức là đối với inline script), trong trường hợp đó nó sẽ không có tác dụng.
    >
    > Thuộc tính `defer` không có tác dụng trên [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules) — chúng defer theo mặc định.

    Các script có thuộc tính `defer` sẽ thực thi theo thứ tự chúng xuất hiện trong tài liệu.

    Thuộc tính này cho phép loại bỏ **JavaScript chặn parser** khi trình duyệt phải tải và đánh giá các script trước khi tiếp tục phân tích cú pháp. `async` có tác dụng tương tự trong trường hợp này.

    Nếu thuộc tính được chỉ định cùng với thuộc tính `async`, phần tử sẽ hoạt động như thể chỉ có thuộc tính `async` được chỉ định.

- [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Attributes/fetchpriority)
  - : Cung cấp gợi ý về mức độ ưu tiên tương đối khi tải xuống một script ngoài. Các giá trị được phép:
    - `high`
      - : Tải xuống script ngoài với mức độ ưu tiên cao so với các script ngoài khác.
    - `low`
      - : Tải xuống script ngoài với mức độ ưu tiên thấp so với các script ngoài khác.
    - `auto`
      - : Không đặt tùy chọn cho mức độ ưu tiên tải xuống.
        Đây là giá trị mặc định.
        Được dùng nếu không có giá trị nào hoặc giá trị không hợp lệ được đặt.
- `integrity`
  - : Thuộc tính này chứa siêu dữ liệu inline mà user agent có thể dùng để xác minh rằng tài nguyên được tải xuống đã được phân phối mà không có thao tác bất ngờ. Thuộc tính không được chỉ định khi thuộc tính `src` vắng mặt. Xem [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity).
- `nomodule`
  - : Thuộc tính Boolean này được đặt để chỉ ra rằng script không nên được thực thi trong các trình duyệt hỗ trợ [ES modules](/en-US/docs/Web/JavaScript/Guide/Modules) — thực tế, thuộc tính này có thể được dùng để cung cấp fallback script cho các trình duyệt cũ không hỗ trợ code JavaScript dạng module.
- `nonce`
  - : Một {{Glossary("Nonce", "nonce")}} mật mã (số dùng một lần) để cho phép các script trong [Content-Security-Policy script-src](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src). Máy chủ phải tạo một giá trị nonce duy nhất mỗi khi truyền chính sách. Điều quan trọng là cung cấp một nonce không thể đoán được vì nếu không thì việc bỏ qua chính sách của tài nguyên là điều rất dễ xảy ra.
- `referrerpolicy`
  - : Chỉ ra [referrer](/en-US/docs/Web/API/Document/referrer) nào cần gửi khi tải xuống script hoặc tài nguyên được script tải xuống:
    - `no-referrer`: Header {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade`: Header {{HTTPHeader("Referer")}} sẽ không được gửi đến {{Glossary("origin")}} không có {{Glossary("TLS")}} ({{Glossary("HTTPS")}}).
    - `origin`: Referrer được gửi sẽ bị giới hạn ở nguồn gốc của trang tham chiếu: [scheme](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), {{Glossary("host")}} và {{Glossary("port")}} của nó.
    - `origin-when-cross-origin`: Referrer được gửi đến các nguồn gốc khác sẽ bị giới hạn ở scheme, host và port. Điều hướng trên cùng nguồn gốc vẫn sẽ bao gồm đường dẫn.
    - `same-origin`: Referrer sẽ được gửi cho {{Glossary("Same-origin policy", "cùng nguồn gốc")}}, nhưng các yêu cầu cross-origin sẽ không chứa thông tin referrer.
    - `strict-origin`: Chỉ gửi nguồn gốc của tài liệu làm referrer khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), nhưng không gửi đến đích ít bảo mật hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` (mặc định): Gửi URL đầy đủ khi thực hiện yêu cầu cùng nguồn gốc, chỉ gửi nguồn gốc khi mức độ bảo mật giao thức giữ nguyên (HTTPS→HTTPS), và không gửi header đến đích ít bảo mật hơn (HTTPS→HTTP).
    - `unsafe-url`: Referrer sẽ bao gồm cả nguồn gốc _và_ đường dẫn (nhưng không bao gồm [fragment](/en-US/docs/Web/API/HTMLAnchorElement/hash), [password](/en-US/docs/Web/API/HTMLAnchorElement/password), hoặc [username](/en-US/docs/Web/API/HTMLAnchorElement/username)). **Giá trị này không an toàn**, vì nó làm lộ nguồn gốc và đường dẫn từ tài nguyên được bảo vệ bằng TLS đến các nguồn gốc không an toàn.

    > [!NOTE]
    > Giá trị chuỗi rỗng (`""`) là cả giá trị mặc định lẫn giá trị dự phòng nếu `referrerpolicy` không được hỗ trợ. Nếu `referrerpolicy` không được chỉ định rõ ràng trên phần tử `<script>`, nó sẽ áp dụng chính sách referrer cấp cao hơn, tức là một chính sách được đặt cho toàn bộ tài liệu hoặc tên miền. Nếu không có chính sách cấp cao hơn, chuỗi rỗng được coi là tương đương với `strict-origin-when-cross-origin`.

- `src`
  - : Thuộc tính này chỉ định URI của một script ngoài; thuộc tính này có thể được dùng như một giải pháp thay thế cho việc nhúng script trực tiếp vào tài liệu.
- [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type)
  - : Thuộc tính này cho biết loại script được biểu diễn.
    Giá trị của thuộc tính này sẽ là một trong các giá trị sau:
    - **Thuộc tính không được đặt (mặc định), chuỗi rỗng, hoặc MIME type JavaScript**
      - : Chỉ ra rằng script là "classic script", chứa code JavaScript.
        Tác giả được khuyến khích bỏ qua thuộc tính nếu script tham chiếu đến code JavaScript thay vì chỉ định MIME type.
        Các MIME type JavaScript được [liệt kê trong thông số kỹ thuật IANA media types](/en-US/docs/Web/HTTP/Guides/MIME_types#textjavascript).
    - [`importmap`](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap)
      - : Giá trị này chỉ ra rằng nội dung của phần tử chứa một import map.
        Import map là một đối tượng JSON mà các nhà phát triển có thể dùng để kiểm soát cách trình duyệt giải quyết các module specifier khi nhập [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps).
    - `module`
      - : Giá trị này khiến code được xử lý như một JavaScript module.
        Việc xử lý nội dung script bị trì hoãn.
        Các thuộc tính `charset` và `defer` không có tác dụng.
        Để biết thông tin về việc sử dụng `module`, hãy xem hướng dẫn [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules) của chúng ta.
        Khác với classic script, module script yêu cầu sử dụng giao thức CORS để tải xuống cross-origin.
    - [`speculationrules`](/en-US/docs/Web/HTML/Reference/Elements/script/type/speculationrules) {{experimental_inline}}
      - : Giá trị này chỉ ra rằng nội dung của phần tử chứa các speculation rule.
        Speculation rule có dạng một đối tượng JSON xác định các tài nguyên nào cần được prefetch hoặc prerender bởi trình duyệt. Đây là một phần của {{domxref("Speculation Rules API", "", "", "nocode")}}.
    - **Bất kỳ giá trị nào khác**
      - : Nội dung nhúng được coi là data block và sẽ không được trình duyệt xử lý.
        Các nhà phát triển phải sử dụng MIME type hợp lệ không phải là MIME type JavaScript để biểu thị data block.
        Tất cả các thuộc tính khác sẽ bị bỏ qua, bao gồm cả thuộc tính `src`.

### Các thuộc tính đã lỗi thời

- `charset` {{Deprecated_inline}}
  - : Nếu có, giá trị của nó phải là kết quả khớp không phân biệt chữ hoa thường theo {{Glossary("ASCII")}} với `utf-8`. Không cần thiết phải chỉ định thuộc tính `charset`, vì tài liệu phải sử dụng UTF-8, và phần tử `script` kế thừa mã hóa ký tự từ tài liệu.
- `language` {{Deprecated_inline}} {{Non-standard_Inline}}
  - : Giống như thuộc tính `type`, thuộc tính này xác định ngôn ngữ scripting đang được sử dụng. Tuy nhiên, không giống như thuộc tính `type`, các giá trị có thể của thuộc tính này chưa bao giờ được chuẩn hóa. Nên sử dụng thuộc tính `type` thay thế.

## Ghi chú

Các script không có thuộc tính [`async`](#async), [`defer`](#defer) hay `type="module"`, cũng như inline script không có thuộc tính `type="module"`, được tải xuống và thực thi ngay trước khi trình duyệt tiếp tục phân tích cú pháp trang.

Script nên được phục vụ với MIME type `text/javascript`, nhưng trình duyệt rộng lượng và chỉ chặn chúng nếu script được phục vụ với image type (`image/*`), video type (`video/*`), audio type (`audio/*`), hoặc `text/csv`.
Nếu script bị chặn, một sự kiện {{domxref("HTMLElement/error_event", "error")}} được gửi đến phần tử; nếu không, một sự kiện {{domxref("HTMLElement/load_event", "load")}} được gửi.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này cho thấy cách nhập (một) script ngoài bằng phần tử `<script>`:

```html
<script src="javascript.js"></script>
```

Ví dụ sau cho thấy cách đặt (một) inline script bên trong phần tử `<script>`:

```html
<script>
  alert("Hello World!");
</script>
```

### async và defer

Các script được tải bằng thuộc tính `async` sẽ tải xuống script mà không chặn trang trong khi script đang được tải xuống.
Tuy nhiên, sau khi tải xuống hoàn tất, script sẽ thực thi, điều này chặn trang không thể hiển thị. Điều này có nghĩa là phần còn lại của nội dung trên trang web bị ngăn xử lý và hiển thị cho người dùng cho đến khi script hoàn thành thực thi.
Bạn không có đảm bảo nào rằng các script sẽ chạy theo bất kỳ thứ tự cụ thể nào.
Tốt nhất là sử dụng `async` khi các script trong trang chạy độc lập với nhau và không phụ thuộc vào script nào khác trên trang.

Các script được tải bằng thuộc tính `defer` sẽ tải theo thứ tự chúng xuất hiện trên trang.
Chúng sẽ không chạy cho đến khi tất cả nội dung trang đã được tải, điều này hữu ích nếu các script của bạn phụ thuộc vào DOM đang ở chỗ (ví dụ, chúng sửa đổi một hoặc nhiều phần tử trên trang).

Đây là biểu diễn trực quan về các phương thức tải script khác nhau và ý nghĩa của chúng đối với trang của bạn:

![How the three script loading method work: default has parsing blocked while JavaScript is fetched and executed. With async, the parsing pauses for execution only. With defer, parsing isn't paused, but execution on happens after everything is else is parsed.](async-defer.jpg)

_Hình ảnh này từ [HTML spec](https://html.spec.whatwg.org/images/asyncdefer.svg), được sao chép và cắt thành phiên bản thu nhỏ, theo điều khoản giấy phép [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)._

Ví dụ, nếu bạn có các phần tử script sau:

```html
<script async src="js/vendor/jquery.js"></script>
<script async src="js/script2.js"></script>
<script async src="js/script3.js"></script>
```

Bạn không thể dựa vào thứ tự tải của các script.
`jquery.js` có thể tải trước hoặc sau `script2.js` và `script3.js` và nếu như vậy, bất kỳ hàm nào trong các script đó phụ thuộc vào `jquery` sẽ tạo ra lỗi vì `jquery` sẽ không được định nghĩa tại thời điểm script chạy.

`async` nên được sử dụng khi bạn có một loạt các background script cần tải, và bạn chỉ muốn đưa chúng vào chỗ càng sớm càng tốt.
Ví dụ, có thể bạn có một số tệp dữ liệu game cần tải, sẽ cần khi game thực sự bắt đầu, nhưng hiện tại bạn chỉ muốn tiếp tục hiển thị phần giới thiệu game, tiêu đề và phòng chờ, mà không bị chặn bởi việc tải script.

Các script được tải bằng thuộc tính `defer` (xem bên dưới) sẽ chạy theo thứ tự chúng xuất hiện trong trang và thực thi chúng ngay khi script và nội dung được tải xuống:

```html
<script defer src="js/vendor/jquery.js"></script>
<script defer src="js/script2.js"></script>
<script defer src="js/script3.js"></script>
```

Trong ví dụ thứ hai, chúng ta có thể chắc chắn rằng `jquery.js` sẽ tải trước `script2.js` và `script3.js` và `script2.js` sẽ tải trước `script3.js`.
Chúng sẽ không chạy cho đến khi tất cả nội dung trang đã được tải, điều này hữu ích nếu các script của bạn phụ thuộc vào DOM đang ở chỗ (ví dụ, chúng sửa đổi một hoặc nhiều phần tử trên trang).

Tóm lại:

- Cả `async` và `defer` đều hướng dẫn trình duyệt tải xuống (các) script trong một luồng riêng, trong khi phần còn lại của trang (DOM, v.v.) đang tải xuống, do đó việc tải trang không bị chặn trong quá trình tải xuống.
- Các script có thuộc tính `async` sẽ thực thi ngay khi tải xuống hoàn tất.
  Điều này chặn trang và không đảm bảo bất kỳ thứ tự thực thi cụ thể nào.
- Các script có thuộc tính `defer` sẽ tải theo thứ tự chúng trong và chỉ thực thi sau khi mọi thứ đã tải xong.
- Nếu các script của bạn nên chạy ngay lập tức và chúng không có bất kỳ phụ thuộc nào, hãy sử dụng `async`.
- Nếu các script của bạn cần chờ phân tích cú pháp và phụ thuộc vào các script khác và/hoặc DOM ở đúng chỗ, hãy tải chúng bằng `defer` và đặt các phần tử `<script>` tương ứng theo thứ tự bạn muốn trình duyệt thực thi chúng.

### Fallback module

Các trình duyệt hỗ trợ giá trị `module` cho thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/script/type) bỏ qua bất kỳ script nào có thuộc tính `nomodule`. Điều đó cho phép bạn sử dụng module script trong khi cung cấp các fallback script được đánh dấu `nomodule` cho các trình duyệt không hỗ trợ.

```html
<script type="module" src="main.js"></script>
<script nomodule src="fallback.js"></script>
```

### Nhập module với importmap

Khi nhập module trong script, nếu bạn không sử dụng tính năng [`type=importmap`](/en-US/docs/Web/HTML/Reference/Elements/script/type/importmap), thì mỗi module phải được nhập bằng module specifier là URL tuyệt đối hoặc tương đối.
Trong ví dụ dưới đây, module specifier đầu tiên là URL tuyệt đối, trong khi module specifier thứ hai (`"./shapes/square.js"`) được giải quyết tương đối với URL cơ sở của tài liệu.

```js
import { name as circleName } from "https://example.com/shapes/circle.js";
import { name as squareName, draw } from "./shapes/square.js";
```

Import map cho phép bạn cung cấp ánh xạ mà nếu khớp, có thể thay thế văn bản trong module specifier.
Import map bên dưới định nghĩa các key `circle` và `square` có thể được dùng làm bí danh cho các module specifier được hiển thị ở trên.

```html
<script type="importmap">
  {
    "imports": {
      "circle": "https://example.com/shapes/circle.js",
      "square": "./shapes/square.js"
    }
  }
</script>
```

Điều này cho phép chúng ta nhập module bằng tên trong module specifier (thay vì URL tuyệt đối hoặc tương đối).

```js
import { name as circleName } from "circle";
import { name as squareName, draw } from "square";
```

Để biết thêm ví dụ về những gì bạn có thể làm với import map, hãy xem phần [Nhập module bằng import map](/en-US/docs/Web/JavaScript/Guide/Modules#importing_modules_using_import_maps) trong hướng dẫn JavaScript modules.

### Nhúng dữ liệu vào HTML

Bạn cũng có thể dùng phần tử `<script>` để nhúng dữ liệu vào HTML với server-side rendering bằng cách chỉ định MIME type hợp lệ không phải JavaScript trong thuộc tính `type`.

```html
<!-- Generated by the server -->
<script id="data" type="application/json">
  {
    "userId": 1234,
    "userName": "Maria Cruz",
    "memberSince": "2000-01-01T00:00:00.000Z"
  }
</script>

<!-- Static -->
<script>
  const userInfo = JSON.parse(document.getElementById("data").text);
  console.log("User information: %o", userInfo);
</script>
```

### Chặn hiển thị cho đến khi script được tải xuống và thực thi

Bạn có thể đưa token `render` vào thuộc tính `blocking`;
việc hiển thị trang sẽ bị chặn cho đến khi script được tải xuống và thực thi. Trong ví dụ bên dưới, chúng ta chặn hiển thị trên một async script,
để script không chặn phân tích cú pháp nhưng được đảm bảo đánh giá trước khi hiển thị bắt đầu.

```html
<script blocking="render" async src="async-script.js"></script>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content">Nội dung metadata</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung flow</a>,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">Nội dung phrasing</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Dynamic script chẳng hạn như <code>text/javascript</code>.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content">nội dung metadata</a>,
        hoặc bất kỳ phần tử nào chấp nhận <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">nội dung phrasing</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLScriptElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.currentScript")}}
- [Bài viết của Flavio Copes về tải JavaScript hiệu quả và giải thích sự khác biệt giữa `async` và `defer`](https://thevalleyofcode.com/javascript-async-defer/)
- Hướng dẫn [JavaScript modules](/en-US/docs/Web/JavaScript/Guide/Modules)

---
title: "<iframe>: The Inline Frame element"
slug: Web/HTML/Reference/Elements/iframe
page-type: html-element
browser-compat: html.elements.iframe
sidebar: htmlsidebar
---

Phần tử **`<iframe>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho {{Glossary("browsing context", "ngữ cảnh duyệt web")}} lồng nhau, nhúng một trang HTML khác vào trang hiện tại.

{{InteractiveExample("HTML Demo: &lt;iframe&gt;", "tabbed-standard")}}

```html interactive-example
<iframe
  id="inlineFrameExample"
  title="Inline Frame Example"
  width="300"
  height="200"
  src="https://www.openstreetmap.org/export/embed.html?bbox=-0.004017949104309083%2C51.47612752641776%2C0.00030577182769775396%2C51.478569861898606&amp;layer=mapnik">
</iframe>
```

```css interactive-example
iframe {
  border: 1px solid black;
  width: 100%; /* takes precedence over the width set with the HTML width attribute */
}
```

Mỗi ngữ cảnh duyệt web nhúng có [document](/en-US/docs/Web/API/Document) riêng và cho phép điều hướng URL. Các điều hướng của mỗi ngữ cảnh duyệt web nhúng được tuyến tính hóa vào [lịch sử phiên](/en-US/docs/Web/API/History) của ngữ cảnh duyệt web _trên cùng_. Ngữ cảnh duyệt web nhúng các ngữ cảnh khác được gọi là _ngữ cảnh duyệt web cha_. Ngữ cảnh duyệt web _trên cùng_ — không có cha — thường là cửa sổ trình duyệt, được đại diện bởi đối tượng {{domxref("Window")}}.

> [!WARNING]
> Vì mỗi ngữ cảnh duyệt web là một môi trường tài liệu hoàn chỉnh, mỗi `<iframe>` trong trang đòi hỏi bộ nhớ tăng lên và các tài nguyên tính toán khác. Mặc dù về lý thuyết bạn có thể sử dụng bao nhiêu `<iframe>` tùy thích, hãy kiểm tra các vấn đề về hiệu suất.

## Thuộc tính

Phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `allow`
  - : Chỉ định [Chính sách quyền](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) cho `<iframe>`. Chính sách xác định các tính năng có sẵn cho `<iframe>` (ví dụ: quyền truy cập vào microphone, camera, pin, web-share, v.v.) dựa trên origin của yêu cầu.

    Xem [iframes](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy#iframes) trong chủ đề `Permissions-Policy` để biết các ví dụ.

    > [!NOTE]
    > Chính sách quyền được chỉ định bởi thuộc tính `allow` triển khai hạn chế thêm trên chính sách được chỉ định trong header {{httpheader("Permissions-Policy")}}. Nó không thay thế chính sách đó.

- `allowfullscreen`
  - : Đặt thành `true` nếu `<iframe>` có thể kích hoạt chế độ toàn màn hình bằng cách gọi phương thức {{domxref("Element.requestFullscreen", "requestFullscreen()")}}.

    > [!NOTE]
    > Thuộc tính này được coi là thuộc tính kế thừa và được định nghĩa lại thành `allow="fullscreen *"`.

- `allowpaymentrequest` {{deprecated_inline}} {{non-standard_inline}}
  - : Đặt thành `true` nếu `<iframe>` cross-origin được phép gọi [Payment Request API](/en-US/docs/Web/API/Payment_Request_API).

    > [!NOTE]
    > Thuộc tính này được coi là thuộc tính kế thừa và được định nghĩa lại thành `allow="payment *"`.

- `browsingtopics` {{non-standard_inline}} {{deprecated_inline}}
  - : Thuộc tính boolean, nếu có, chỉ định rằng các chủ đề được chọn cho người dùng hiện tại nên được gửi cùng với yêu cầu cho nguồn của `<iframe>`. Xem [Using the Topics API](/en-US/docs/Web/API/Topics_API/Using) để biết thêm chi tiết.

- `credentialless` {{Experimental_Inline}}
  - : Đặt thành `true` để làm cho `<iframe>` không có thông tin xác thực, nghĩa là nội dung của nó sẽ được tải trong ngữ cảnh mới, tạm thời. Nó không có quyền truy cập vào mạng, cookie và dữ liệu lưu trữ liên quan đến origin của nó. Nó sử dụng ngữ cảnh mới cục bộ cho vòng đời tài liệu cấp cao nhất. Đổi lại, các quy tắc nhúng {{httpheader("Cross-Origin-Embedder-Policy")}} (COEP) có thể được dỡ bỏ, vì vậy các tài liệu có COEP được đặt có thể nhúng các tài liệu bên thứ ba không có điều đó. Xem [IFrame credentialless](/en-US/docs/Web/HTTP/Guides/IFrame_credentialless) để biết thêm chi tiết.

- `csp` {{experimental_inline}}
  - : [Chính sách bảo mật nội dung](/en-US/docs/Web/HTTP/Guides/CSP) được áp dụng cho tài nguyên được nhúng. Xem {{domxref("HTMLIFrameElement.csp")}} để biết chi tiết.

- `height`
  - : Chiều cao của khung tính bằng CSS pixels. Mặc định là `150`.
- `loading`
  - : Cho biết khi nào trình duyệt nên tải iframe:
    - `eager`
      - : Tải iframe ngay khi tải trang (đây là giá trị mặc định).
    - `lazy`
      - : Trì hoãn việc tải iframe cho đến khi nó đến khoảng cách tính toán từ {{glossary("visual viewport", "khung nhìn trực quan")}}, được xác định bởi trình duyệt.
        Mục đích là tránh sử dụng băng thông mạng và lưu trữ cần thiết để tải khung cho đến khi trình duyệt chắc chắn rằng nó sẽ cần.
        Điều này cải thiện hiệu suất và chi phí trong hầu hết các trường hợp sử dụng điển hình, đặc biệt bằng cách giảm thời gian tải trang ban đầu.

        > [!NOTE]
        > Việc tải chỉ bị trì hoãn khi JavaScript được bật.
        > Đây là biện pháp chống theo dõi.

- `name`
  - : Tên có thể nhắm mục tiêu cho ngữ cảnh duyệt web nhúng. Tên này có thể được sử dụng trong thuộc tính `target` của các phần tử {{HTMLElement("a")}}, {{HTMLElement("form")}} hoặc {{HTMLElement("base")}}; thuộc tính `formtarget` của các phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("button")}}; hoặc tham số `windowName` trong phương thức {{domxref("Window.open()","window.open()")}}. Ngoài ra, tên trở thành thuộc tính của các đối tượng {{domxref("Window")}} và {{domxref("Document")}}, chứa tham chiếu đến cửa sổ nhúng hoặc chính phần tử đó.

- `privateToken` {{experimental_inline}}
  - : Chứa biểu diễn chuỗi của đối tượng tùy chọn đại diện cho thao tác [private state token](/en-US/docs/Web/API/Private_State_Token_API/Using); đối tượng này có cấu trúc tương tự như thuộc tính [`privateToken`](/en-US/docs/Web/API/RequestInit#privatetoken) của dictionary `RequestInit`. Các IFrame chứa thuộc tính này có thể khởi tạo các thao tác như phát hành hoặc đổi token khi nội dung nhúng của chúng được tải.

- `referrerpolicy`
  - : Cho biết [referrer](/en-US/docs/Web/API/Document/referrer) nào sẽ gửi khi tải tài nguyên của khung:
    - `no-referrer`
      - : Header {{HTTPHeader("Referer")}} sẽ không được gửi.
    - `no-referrer-when-downgrade`
      - : Header {{HTTPHeader("Referer")}} sẽ không được gửi đến {{Glossary("origin")}} không có {{Glossary("TLS")}} ({{Glossary("HTTPS")}}).
    - `origin`
      - : Referrer được gửi sẽ bị giới hạn ở origin của trang tham chiếu: [scheme](/en-US/docs/Learn_web_development/Howto/Web_mechanics/What_is_a_URL), {{Glossary("host")}} và {{Glossary("port")}} của nó.
    - `origin-when-cross-origin`
      - : Referrer được gửi đến các origin khác sẽ bị giới hạn ở scheme, host và port. Các điều hướng trên cùng origin vẫn sẽ bao gồm đường dẫn.
    - `same-origin`
      - : Referrer sẽ được gửi cho {{Glossary("Same-origin policy", "cùng origin")}}, nhưng các yêu cầu cross-origin sẽ không chứa thông tin referrer.
    - `strict-origin`
      - : Chỉ gửi origin của tài liệu như referrer khi mức bảo mật giao thức vẫn giữ nguyên (HTTPS→HTTPS), nhưng không gửi đến đích kém bảo mật hơn (HTTPS→HTTP).
    - `strict-origin-when-cross-origin` (mặc định)
      - : Gửi URL đầy đủ khi thực hiện yêu cầu cùng origin, chỉ gửi origin khi mức bảo mật giao thức vẫn giữ nguyên (HTTPS→HTTPS), và không gửi header đến đích kém bảo mật hơn (HTTPS→HTTP).
    - `unsafe-url`
      - : Referrer sẽ bao gồm origin _và_ đường dẫn (nhưng không bao gồm [fragment](/en-US/docs/Web/API/HTMLAnchorElement/hash), [password](/en-US/docs/Web/API/HTMLAnchorElement/password) hoặc [username](/en-US/docs/Web/API/HTMLAnchorElement/username)). **Giá trị này không an toàn**, vì nó rò rỉ origin và đường dẫn từ các tài nguyên được bảo vệ TLS đến các origin không an toàn.

- `sandbox`
  - : Kiểm soát các hạn chế được áp dụng cho nội dung nhúng trong `<iframe>`. Giá trị của thuộc tính có thể để trống để áp dụng tất cả các hạn chế, hoặc các token cách nhau bằng dấu cách để dỡ bỏ các hạn chế cụ thể:
    - `allow-downloads`
      - : Cho phép tải file qua phần tử {{HTMLElement("a")}} hoặc {{HTMLElement("area")}} với thuộc tính [download](/en-US/docs/Web/HTML/Reference/Elements/a#download), cũng như qua điều hướng dẫn đến việc tải file. Điều này hoạt động bất kể người dùng có nhấp vào liên kết hay code JS khởi tạo nó không có tương tác người dùng.
    - `allow-forms`
      - : Cho phép trang gửi form. Nếu từ khóa này không được sử dụng, form sẽ được hiển thị bình thường, nhưng việc gửi sẽ không kích hoạt kiểm tra nhập liệu, gửi dữ liệu đến máy chủ web hoặc đóng hộp thoại.
    - `allow-modals`
      - : Cho phép trang mở cửa sổ modal bằng {{domxref("Window.alert()")}}, {{domxref("Window.confirm()")}}, {{domxref("Window.print()")}} và {{domxref("Window.prompt()")}}, trong khi mở {{HTMLElement("dialog")}} được phép bất kể từ khóa này. Nó cũng cho phép trang nhận sự kiện {{domxref("BeforeUnloadEvent")}}.
    - `allow-orientation-lock`
      - : Cho phép tài nguyên [khóa hướng màn hình](/en-US/docs/Web/API/Screen/lockOrientation).
    - `allow-pointer-lock`
      - : Cho phép trang sử dụng [Pointer Lock API](/en-US/docs/Web/API/Pointer_Lock_API).
    - `allow-popups`
      - : Cho phép popup (được tạo, ví dụ, bởi {{domxref("Window.open()")}} hoặc `target="_blank"`). Nếu từ khóa này không được sử dụng, các chức năng đó sẽ âm thầm thất bại.
    - `allow-popups-to-escape-sandbox`
      - : Cho phép tài liệu sandbox mở ngữ cảnh duyệt web mới mà không buộc cờ sandbox lên nó. Điều này sẽ cho phép, ví dụ, quảng cáo bên thứ ba được sandbox an toàn mà không buộc các hạn chế tương tự lên trang mà quảng cáo liên kết đến. Nếu cờ này không được bao gồm, trang được chuyển hướng, cửa sổ popup hoặc tab mới sẽ tuân theo cùng các hạn chế sandbox như `<iframe>` gốc.
    - `allow-presentation`
      - : Cho phép trình nhúng kiểm soát liệu iframe có thể bắt đầu [phiên trình bày](/en-US/docs/Web/API/PresentationRequest) hay không.
    - `allow-same-origin`
      - : Nếu token này không được sử dụng, tài nguyên được coi là từ một origin đặc biệt luôn thất bại {{Glossary("same-origin policy")}} (có thể ngăn quyền truy cập vào [lưu trữ dữ liệu/cookie](/en-US/docs/Web/Security/Defenses/Same-origin_policy#cross-origin_data_storage_access) và một số API JavaScript).
        > [!NOTE]
        > Khi `allow-same-origin` hiện diện, tài liệu cha cùng origin vẫn có thể truy cập và tương tác với DOM của iframe ngay cả khi `allow-scripts` không được đặt. Token `allow-scripts` chỉ kiểm soát việc thực thi script trong ngữ cảnh duyệt web nhúng và không ảnh hưởng đến quyền truy cập DOM từ cha.
    - `allow-scripts`
      - : Cho phép trang chạy script (nhưng không tạo cửa sổ popup). Nếu từ khóa này không được sử dụng, thao tác này không được phép.
    - `allow-storage-access-by-user-activation` {{experimental_inline}}
      - : Cho phép tài liệu được tải trong `<iframe>` sử dụng {{domxref("Storage Access API", "Storage Access API", "", "nocode")}} để yêu cầu quyền truy cập vào cookie không phân vùng.
    - `allow-top-navigation`
      - : Cho phép tài nguyên điều hướng ngữ cảnh duyệt web cấp cao nhất (được đặt tên `_top`).
    - `allow-top-navigation-by-user-activation`
      - : Cho phép tài nguyên điều hướng ngữ cảnh duyệt web cấp cao nhất, nhưng chỉ khi được khởi tạo bởi hành động của người dùng.
    - `allow-top-navigation-to-custom-protocols`
      - : Cho phép điều hướng đến các giao thức không phải `http` được tích hợp vào trình duyệt hoặc [đã đăng ký bởi trang web](/en-US/docs/Web/API/Navigator/registerProtocolHandler). Tính năng này cũng được kích hoạt bởi từ khóa `allow-popups` hoặc `allow-top-navigation`.

    > [!NOTE]
    >
    > - Khi tài liệu nhúng có cùng origin với trang nhúng, **rất không khuyến nghị** sử dụng cả `allow-scripts` và `allow-same-origin`, vì điều đó cho phép tài liệu nhúng xóa thuộc tính `sandbox` — làm cho nó không còn an toàn hơn so với việc không sử dụng thuộc tính `sandbox` chút nào.
    > - Sandbox vô dụng nếu kẻ tấn công có thể hiển thị nội dung bên ngoài iframe được sandbox — chẳng hạn nếu người xem mở khung trong tab mới. Nội dung như vậy cũng nên được phục vụ từ _origin riêng biệt_ để hạn chế thiệt hại tiềm tàng.

    > [!NOTE]
    > Khi chuyển hướng người dùng, mở cửa sổ popup hoặc mở tab mới từ trang nhúng trong `<iframe>` với thuộc tính `sandbox`, ngữ cảnh duyệt web mới sẽ tuân theo cùng các hạn chế sandbox. Điều này có thể tạo ra vấn đề — ví dụ: nếu trang được nhúng trong `<iframe>` không có `sandbox="allow-forms"` hoặc `sandbox="allow-popups-to-escape-sandbox"` mở trang mới trong tab riêng, việc gửi form trong ngữ cảnh duyệt web mới đó sẽ âm thầm thất bại.

- `src`
  - : URL của trang cần nhúng. Sử dụng giá trị `about:blank` để nhúng trang trống tuân theo [chính sách cùng origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy#inherited_origins). Cũng lưu ý rằng việc xóa thuộc tính `src` của `<iframe>` theo chương trình (ví dụ: qua {{domxref("Element.removeAttribute()")}}) sẽ khiến `about:blank` được tải trong khung trong Firefox (từ phiên bản 65), các trình duyệt dựa trên Chromium và Safari/iOS.

    > [!NOTE]
    > Trang `about:blank` sử dụng URL của tài liệu nhúng làm URL cơ sở khi giải quyết bất kỳ URL tương đối nào, chẳng hạn như liên kết anchor.

- `srcdoc`
  - : HTML nội tuyến để nhúng, ghi đè thuộc tính `src`. Nội dung của nó phải tuân theo cú pháp của tài liệu HTML đầy đủ, bao gồm chỉ thị doctype, thẻ `<html>`, `<body>`, v.v., mặc dù hầu hết trong số đó có thể bị bỏ qua, chỉ để lại nội dung body. Tài liệu này sẽ có `about:srcdoc` là vị trí của nó. Nếu trình duyệt không hỗ trợ thuộc tính `srcdoc`, nó sẽ quay về URL trong thuộc tính `src`.

    > [!NOTE]
    > Trang `about:srcdoc` sử dụng URL của tài liệu nhúng làm URL cơ sở khi giải quyết bất kỳ URL tương đối nào, chẳng hạn như liên kết anchor.

- `width`
  - : Chiều rộng của khung tính bằng CSS pixels. Mặc định là `300`.

### Thuộc tính không còn dùng

Các thuộc tính này đã không còn được dùng và có thể không còn được hỗ trợ bởi tất cả các tác nhân người dùng. Bạn không nên sử dụng chúng trong nội dung mới, và cố gắng xóa chúng khỏi nội dung hiện có.

- `align` {{deprecated_inline}}
  - : Căn chỉnh của phần tử này so với ngữ cảnh xung quanh.
- `frameborder` {{deprecated_inline}}
  - : Giá trị `1` (mặc định) vẽ đường viền xung quanh khung này. Giá trị `0` xóa đường viền xung quanh khung này, nhưng thay vào đó bạn nên sử dụng thuộc tính CSS {{cssxref("border")}} để kiểm soát đường viền `<iframe>`.
- `longdesc` {{deprecated_inline}}
  - : URL của mô tả dài về nội dung khung. Do bị lạm dụng phổ biến, thuộc tính này không hữu ích cho các trình duyệt không nhìn thấy.
- `marginheight` {{deprecated_inline}}
  - : Khoảng cách tính bằng pixel giữa nội dung khung và đường viền trên và dưới của nó.
- `marginwidth` {{deprecated_inline}}
  - : Khoảng cách tính bằng pixel giữa nội dung khung và đường viền trái và phải của nó.
- `scrolling` {{deprecated_inline}}
  - : Cho biết khi nào trình duyệt cần cung cấp thanh cuộn cho khung:
    - `auto`
      - : Chỉ khi nội dung khung lớn hơn kích thước của nó.
    - `yes`
      - : Luôn hiển thị thanh cuộn.
    - `no`
      - : Không bao giờ hiển thị thanh cuộn.

## Scripting

Các frame nội tuyến, như các phần tử {{HTMLElement("frame")}}, được bao gồm trong mảng giả {{domxref("window.frames")}}.

Với đối tượng DOM {{domxref("HTMLIFrameElement")}}, các script có thể truy cập đối tượng {{domxref("window")}} của tài nguyên trong khung qua thuộc tính {{domxref("HTMLIFrameElement.contentWindow", "contentWindow")}}. Thuộc tính {{domxref("HTMLIFrameElement.contentDocument", "contentDocument")}} tham chiếu đến `document` bên trong `<iframe>`, giống như `contentWindow.document`.

Từ bên trong khung, một script có thể lấy tham chiếu đến cửa sổ cha bằng {{domxref("window.parent")}}.

Quyền truy cập script vào nội dung khung tuân theo [chính sách cùng origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy).
Các script không thể truy cập hầu hết các thuộc tính trong các đối tượng `window` khác nếu script được tải từ origin khác, bao gồm các script trong khung truy cập cha của khung.
Giao tiếp cross-origin có thể đạt được bằng cách sử dụng {{domxref("Window.postMessage()")}}.

### Điều hướng top trong các frame cross-origin

Các script chạy trong frame cùng origin có thể truy cập thuộc tính {{domxref("Window.top")}} và đặt {{domxref("Window.location","window.top.location")}} để chuyển hướng trang cấp cao nhất đến vị trí mới.
Hành vi này được gọi là "điều hướng top".

Frame cross-origin được phép chuyển hướng trang cấp cao nhất bằng `top` chỉ khi frame có {{glossary("sticky activation", "kích hoạt dính")}}.
Nếu điều hướng top bị chặn, trình duyệt có thể nhắc xin phép người dùng để chuyển hướng hoặc báo cáo lỗi trong bảng điều khiển nhà phát triển (hoặc cả hai).
Hạn chế này của trình duyệt được gọi là _framebusting intervention_.
Điều này có nghĩa là frame cross-origin không thể chuyển hướng trang cấp cao nhất ngay lập tức — người dùng phải trước đó đã tương tác với frame hoặc cấp quyền chuyển hướng.

Frame sandbox chặn tất cả điều hướng top trừ khi giá trị thuộc tính `sandbox` được đặt thành [`allow-top-navigation`](#allow-top-navigation) hoặc [`allow-top-navigation-by-user-activation`](#allow-top-navigation-by-user-activation).
Lưu ý rằng quyền điều hướng top được kế thừa, vì vậy frame lồng nhau chỉ có thể thực hiện điều hướng top nếu các frame cha của nó cũng được phép.

## Định vị và thu phóng

Là {{ glossary("replaced elements", "phần tử thay thế")}}, `<iframe>` cho phép điều chỉnh vị trí của tài liệu nhúng trong hộp của nó bằng thuộc tính {{cssxref("object-position")}}.

> [!NOTE]
> Thuộc tính {{cssxref("object-fit")}} không có hiệu lực trên các phần tử `<iframe>`.

## Hành vi sự kiện `error` và `load`

Các sự kiện `error` và `load` được kích hoạt trên `<iframe>` có thể được sử dụng để dò không gian URL của các máy chủ HTTP mạng cục bộ. Do đó, như một biện pháp bảo mật, các tác nhân người dùng không kích hoạt sự kiện [error](/en-US/docs/Web/API/HTMLElement/error_event) trên `<iframe>`, và sự kiện [load](/en-US/docs/Web/API/HTMLElement/load_event) luôn được kích hoạt ngay cả khi nội dung `<iframe>` không tải được.

## Khả năng tiếp cận

Những người điều hướng bằng công nghệ hỗ trợ như trình đọc màn hình có thể sử dụng [thuộc tính `title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) trên `<iframe>` để gán nhãn nội dung của nó. Giá trị của tiêu đề cần mô tả ngắn gọn nội dung nhúng:

```html
<iframe
  title="Wikipedia page for Avocados"
  src="https://en.wikipedia.org/wiki/Avocado"></iframe>
```

Không có tiêu đề này, họ phải điều hướng vào `<iframe>` để xác định nội dung nhúng là gì. Sự thay đổi ngữ cảnh này có thể gây nhầm lẫn và tốn thời gian, đặc biệt cho các trang có nhiều `<iframe>` và/hoặc nếu các nhúng chứa nội dung tương tác như video hoặc âm thanh.

## Ví dụ

### \<iframe> cơ bản

Ví dụ này nhúng trang tại <https://example.org> trong một iframe. Đây là trường hợp sử dụng phổ biến của iframe: nhúng nội dung từ một trang khác. Ví dụ, bản thân mẫu trực tiếp và ví dụ [thử nghiệm](#try_it) ở trên đều là nhúng `<iframe>` nội dung từ một trang MDN khác.

#### HTML

```html
<iframe
  src="https://example.org"
  title="iframe Example 1"
  width="400"
  height="300">
</iframe>
```

#### Kết quả

{{ EmbedLiveSample('A_basic_iframe', 640,400)}}

### Nhúng mã nguồn trong \<iframe>

Ví dụ này kết xuất trực tiếp mã nguồn trong một iframe. Điều này có thể được sử dụng như một kỹ thuật để ngăn tiêm script khi hiển thị nội dung do người dùng tạo, khi kết hợp với thuộc tính `sandbox`.

Lưu ý rằng khi sử dụng `srcdoc`, bất kỳ URL tương đối nào trong nội dung nhúng sẽ được giải quyết tương đối với URL của trang nhúng. Nếu bạn muốn sử dụng liên kết anchor trỏ đến các vị trí trong nội dung nhúng, bạn cần chỉ định rõ ràng `about:srcdoc` làm URL cơ sở.

#### HTML

```html-nolint
<article>
  <footer>Nine minutes ago, <i>jc</i> wrote:</footer>
  <iframe
    sandbox
    srcdoc="<p>There are two ways to use the <code>iframe</code> element:</p>
<ol>
<li><a href=&quot;about:srcdoc#embed_another&quot;>To embed content from another page</a></li>
<li><a href=&quot;about:srcdoc#embed_user&quot;>To embed user-generated content</a></li>
</ol>
<h2 id=&quot;embed_another&quot;>Embedding content from another page</h2>
<p>Use the <code>src</code> attribute to specify the URL of the page to embed:</p>
<pre><code>&amp;lt;iframe src=&quot;https://example.org&quot;&amp;gt;&amp;lt;/iframe&amp;gt;</code></pre>
<h2 id=&quot;embed_user&quot;>Embedding user-generated content</h2>
<p>Use the <code>srcdoc</code> attribute to specify the content to embed. This post is already an example!</p>
"
    width="500"
    height="250"
></iframe>
</article>
```

Đây là cách viết các chuỗi thoát khi sử dụng `srcdoc`:

- Đầu tiên, viết HTML, thoát bất cứ thứ gì bạn sẽ thoát trong tài liệu HTML thông thường (chẳng hạn như `<`, `>`, `&`, v.v.).
- `&lt;` và `<` đại diện cho cùng ký tự trong thuộc tính `srcdoc`. Do đó, để làm cho nó trở thành chuỗi thoát thực sự trong tài liệu HTML, hãy thay thế bất kỳ dấu và (`&`) nào bằng `&amp;`. Ví dụ: `&lt;` trở thành `&amp;lt;`, và `&amp;` trở thành `&amp;amp;`.
- Thay thế bất kỳ dấu ngoặc kép đôi (`"`) bằng `&quot;` để ngăn thuộc tính `srcdoc` bị kết thúc sớm (nếu bạn sử dụng `'` thay thế, thì bạn nên thay thế `'` bằng `&apos;` thay thế). Bước này xảy ra sau bước trước, vì vậy `&quot;` được tạo ra trong bước này không trở thành `&amp;quot;`.

#### Kết quả

{{ EmbedLiveSample('Embedding_source_code_in_an_iframe', 640, 300)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung nhúng, nội dung tương tác, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Bất kỳ phần tử nào chấp nhận nội dung nhúng.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role"><code>application</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"><code>document</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role"><code>img</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLIFrameElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSP: frame-ancestors](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors)
- [Quyền riêng tư, quyền hạn và bảo mật thông tin](/en-US/docs/Web/Privacy)

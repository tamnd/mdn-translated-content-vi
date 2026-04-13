---
title: Clipboard API
slug: Web/API/Clipboard_API
page-type: web-api-overview
browser-compat:
  - api.Clipboard
  - api.ClipboardChangeEvent
  - api.ClipboardEvent
  - api.ClipboardItem
---

{{DefaultAPISidebar("Clipboard API")}}

**Clipboard API** cung cấp khả năng phản hồi các lệnh clipboard (cắt, sao chép và dán), cũng như đọc từ và ghi vào clipboard của hệ thống một cách bất đồng bộ.

> [!NOTE]
> Hãy ưu tiên dùng API này thay cho phương thức đã lỗi thời {{domxref("document.execCommand()")}} để truy cập clipboard.

> [!NOTE]
> API này _không dùng được_ trong [Web Worker](/en-US/docs/Web/API/Web_Workers_API) (không được phơi bày qua {{domxref("WorkerNavigator")}}).

## Khái niệm và cách dùng

_Clipboard hệ thống_ là một vùng đệm dữ liệu thuộc về hệ điều hành đang chạy trình duyệt, được dùng để lưu trữ dữ liệu ngắn hạn và/hoặc truyền dữ liệu giữa các tài liệu hay ứng dụng.
Nó thường được triển khai như một [vùng đệm dữ liệu](https://en.wikipedia.org/wiki/Data_buffer) ẩn danh, tạm thời, đôi khi được gọi là _paste buffer_, mà phần lớn hoặc toàn bộ chương trình trong môi trường có thể truy cập thông qua các giao diện lập trình đã xác định.

Clipboard API cho phép người dùng đọc và ghi văn bản cũng như các loại dữ liệu khác vào và ra khỏi clipboard hệ thống theo cách lập trình trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts), miễn là người dùng đã đáp ứng các tiêu chí nêu trong phần [Cân nhắc về bảo mật](#security_considerations).

Các sự kiện được phát ra do thao tác {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}} và {{domxref("Element/paste_event", "paste")}} làm thay đổi clipboard.
Các sự kiện này có hành động mặc định, ví dụ hành động `copy` mặc định sẽ sao chép vùng chọn hiện tại vào clipboard hệ thống.
Trình xử lý sự kiện có thể ghi đè hành động mặc định; xem từng sự kiện để biết thêm thông tin.

Ngoài ra còn có sự kiện {{domxref("Clipboard.clipboardchange_event","clipboardchange")}} được kích hoạt trực tiếp trên đối tượng {{domxref("Clipboard")}} bất cứ khi nào nội dung clipboard hệ thống thay đổi. Điều này hữu ích để thông báo cho ứng dụng về sự thay đổi của clipboard hệ thống, chẳng hạn khi ứng dụng có clipboard riêng cần được giữ đồng bộ.

## Giao diện

- {{domxref("Clipboard")}} {{securecontext_inline}}
  - : Cung cấp một giao diện để đọc và ghi văn bản và dữ liệu vào hoặc ra khỏi clipboard hệ thống.
    Đặc tả gọi phần này là "Async Clipboard API".
- {{domxref("ClipboardChangeEvent")}}
  - : Biểu diễn các sự kiện được phát ra bất cứ khi nào nội dung clipboard hệ thống thay đổi.
- {{domxref("ClipboardEvent")}}
  - : Biểu diễn các sự kiện cung cấp thông tin liên quan đến việc sửa đổi clipboard, cụ thể là các sự kiện {{domxref("Element/cut_event", "cut")}}, {{domxref("Element/copy_event", "copy")}} và {{domxref("Element/paste_event", "paste")}}.
    Đặc tả gọi phần này là "Clipboard Event API".
- {{domxref("ClipboardItem")}} {{securecontext_inline}}
  - : Biểu diễn định dạng của một mục đơn lẻ, được dùng khi đọc hoặc ghi dữ liệu.

### Mở rộng cho các giao diện khác

Clipboard API mở rộng các API sau, bổ sung các tính năng được liệt kê.

- {{domxref("Navigator.clipboard")}} {{readonlyinline}} {{securecontext_inline}}
  - : Trả về một đối tượng {{domxref("Clipboard")}} cung cấp quyền đọc và ghi vào clipboard hệ thống.
- `Element` [`copy`](/en-US/docs/Web/API/Element/copy_event) event
  - : Một sự kiện được kích hoạt bất cứ khi nào người dùng khởi tạo thao tác sao chép.
- `Element` [`cut`](/en-US/docs/Web/API/Element/cut_event) event
  - : Một sự kiện được kích hoạt bất cứ khi nào người dùng khởi tạo thao tác cắt.
- `Element` [`paste`](/en-US/docs/Web/API/Element/paste_event) event
  - : Một sự kiện được kích hoạt bất cứ khi nào người dùng khởi tạo thao tác dán.

<a id="security_considerations"></a>

## Cân nhắc về bảo mật

Clipboard API cho phép người dùng đọc và ghi văn bản cũng như các loại dữ liệu khác vào và ra khỏi clipboard hệ thống trong [ngữ cảnh bảo mật](/en-US/docs/Web/Security/Defenses/Secure_Contexts).

Khi đọc từ clipboard, đặc tả yêu cầu người dùng phải vừa mới tương tác với trang ([kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation)) và lệnh gọi được thực hiện như là kết quả của việc người dùng tương tác với một "phần tử dán" của trình duyệt hoặc hệ điều hành (ví dụ chọn "Paste" trong menu ngữ cảnh gốc). Trên thực tế, trình duyệt thường cho phép các thao tác đọc không đáp ứng các yêu cầu này, nhưng thay vào đó áp dụng các yêu cầu khác (chẳng hạn một quyền hoặc hộp nhắc cho từng thao tác).
Đối với việc ghi vào clipboard, đặc tả kỳ vọng trang đã được cấp quyền `clipboard-write` của [Permissions API](/en-US/docs/Web/API/Permissions_API), và trình duyệt cũng có thể yêu cầu [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation).
Trình duyệt có thể đặt thêm các hạn chế khác đối với việc dùng các phương thức truy cập clipboard.

Sự kiện {{domxref("Clipboard.clipboardchange_event", "clipboardchange")}} chỉ được kích hoạt với [sticky activation](/en-US/docs/Glossary/Sticky_activation) hoặc sau khi quyền `clipboard-read` được cấp.

Các cách triển khai của trình duyệt đã khác biệt so với đặc tả.
Những khác biệt này được nêu trong phần [Tương thích trình duyệt](#browser_compatibility) và tình trạng hiện tại được tóm tắt bên dưới:

Trình duyệt Chromium:

- Nếu thao tác đọc không được đặc tả cho phép và tài liệu đang có focus, trình duyệt sẽ kích hoạt yêu cầu dùng quyền `clipboard-read` và sẽ thành công nếu quyền đó được cấp (hoặc vì người dùng chấp nhận hộp nhắc, hoặc vì quyền đã được cấp sẵn).
- Việc ghi yêu cầu quyền `clipboard-write` hoặc kích hoạt tạm thời.
  Nếu quyền đã được cấp thì nó sẽ được duy trì và các lần sau không cần kích hoạt tạm thời nữa.
- Các quyền HTTP [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) là `clipboard-read` và `clipboard-write` phải được cho phép đối với phần tử {{HTMLElement("iframe")}} truy cập clipboard.

Firefox và Safari:

- Nếu thao tác đọc không được đặc tả cho phép nhưng vẫn đáp ứng kích hoạt người dùng tạm thời, trình duyệt sẽ hiện một hộp nhắc cho người dùng dưới dạng menu ngữ cảnh tạm thời với duy nhất tùy chọn "Paste" (chỉ được bật sau 1 giây) và sẽ thành công nếu người dùng chọn tùy chọn đó.
- Việc ghi yêu cầu kích hoạt tạm thời.
- Hộp nhắc dán sẽ bị bỏ qua khi đọc nội dung clipboard cùng origin, nhưng không bị bỏ qua với nội dung khác origin.
- Các quyền `clipboard-read` và `clipboard-write` không được Firefox hay Safari hỗ trợ (và cũng không có kế hoạch hỗ trợ).

Firefox [web extension](/en-US/docs/Mozilla/Add-ons/WebExtensions/Interact_with_the_clipboard):

- Việc đọc khả dụng cho extension có quyền web extension [`clipboardRead`](/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/permissions#clipboardread). Với quyền này, extension không cần kích hoạt tạm thời hay dùng hộp nhắc dán. Từ Firefox 147, việc đọc cũng khả dụng mà không cần quyền trong ngữ cảnh bảo mật, với kích hoạt tạm thời, và sau khi người dùng nhấp vào hộp nhắc dán trong menu ngữ cảnh tạm thời.
- Việc ghi khả dụng trong ngữ cảnh bảo mật và với kích hoạt tạm thời. Tuy nhiên, với quyền web extension [`clipboardWrite`](/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/permissions#clipboardwrite), kích hoạt tạm thời là không cần thiết.

## Ví dụ

### Truy cập clipboard

Clipboard hệ thống được truy cập thông qua biến toàn cục {{domxref("Navigator.clipboard")}}.

Đoạn mã này lấy văn bản từ clipboard và nối thêm nó vào phần tử đầu tiên tìm thấy có lớp `editor`.
Vì {{domxref("Clipboard.readText", "readText()")}} trả về chuỗi rỗng nếu clipboard không chứa văn bản, đoạn mã này là an toàn.

```js
navigator.clipboard
  .readText()
  .then(
    (clipText) => (document.querySelector(".editor").innerText += clipText),
  );
```

## Thông số kỹ thuật

{{Specifications}}

<a id="browser_compatibility"></a>

## Tương thích trình duyệt

{{Compat}}

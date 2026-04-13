---
title: HTMLScriptElement
slug: Web/API/HTMLScriptElement
page-type: web-api-interface
browser-compat: api.HTMLScriptElement
---

{{APIRef("HTML DOM")}}

Các phần tử HTML {{HTMLElement("script")}} hiển thị giao diện **`HTMLScriptElement`**, cung cấp các thuộc tính và phương thức đặc biệt để thao tác hành vi và việc thực thi của các phần tử `<script>` (ngoài giao diện {{domxref("HTMLElement")}} được kế thừa).

Các tệp JavaScript nên được phục vụ với [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) `text/javascript`, nhưng trình duyệt khá linh hoạt và chỉ chặn chúng nếu script được phục vụ với kiểu ảnh (`image/*`), kiểu video (`video/*`), kiểu âm thanh (`audio/*`), hoặc `text/csv`. Nếu script bị chặn, phần tử của nó sẽ nhận sự kiện {{domxref("HTMLElement/error_event", "error")}}; nếu không, nó sẽ nhận sự kiện {{domxref("Window/load_event", "load")}}.

> [!NOTE]
> Khi được chèn bằng phương thức {{domxref("Document.write()")}}, các phần tử {{HTMLElement("script")}} sẽ được thực thi (thường là đồng bộ), nhưng khi được chèn bằng {{domxref("Element.innerHTML")}} hoặc {{domxref("Element.outerHTML")}}, chúng hoàn toàn không được thực thi.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa thuộc tính từ phần tử cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLScriptElement.attributionSrc")}} {{securecontext_inline}} {{deprecated_inline}}
  - : Lấy và đặt thuộc tính [`attributionsrc`](/en-US/docs/Web/HTML/Reference/Elements/script#attributionsrc) trên phần tử {{htmlelement("script")}} theo chương trình, phản ánh giá trị của thuộc tính đó. `attributionsrc` chỉ định rằng bạn muốn trình duyệt gửi tiêu đề {{httpheader("Attribution-Reporting-Eligible")}} cùng với yêu cầu tài nguyên script. Ở phía máy chủ, tiêu đề này được dùng để kích hoạt việc gửi `Attribution-Reporting-Register-Source` hoặc `Attribution-Reporting-Register-Trigger` trong phản hồi, để đăng ký [nguồn phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_sources#javascript-based_event_sources) hoặc [kích hoạt phân bổ](/en-US/docs/Web/API/Attribution_Reporting_API/Registering_triggers#javascript-based_attribution_triggers) dựa trên JavaScript.
- {{domxref("HTMLScriptElement.async")}}
  - : Giá trị boolean điều khiển cách script được thực thi. Với classic scripts, nếu thuộc tính `async` được đặt thành `true`, script ngoài sẽ được tìm nạp song song với quá trình phân tích cú pháp và được đánh giá ngay khi sẵn sàng. Với [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules), nếu `async` là `true`, script và toàn bộ phụ thuộc của nó sẽ được tìm nạp song song với quá trình phân tích cú pháp và được đánh giá ngay khi sẵn sàng.
- {{domxref("HTMLScriptElement.blocking")}}
  - : Chuỗi chỉ ra rằng một số thao tác nhất định nên bị chặn trong lúc tìm nạp script. Nó phản ánh thuộc tính `blocking` của phần tử {{HTMLElement("script")}}.
- `HTMLScriptElement.charset` {{deprecated_inline}}
  - : Chuỗi biểu thị mã hóa ký tự của một script ngoài. Nó phản ánh thuộc tính [`charset`](/en-US/docs/Web/HTML/Reference/Elements/script#charset).
- {{domxref("HTMLScriptElement.crossOrigin")}}
  - : Chuỗi phản ánh cấu hình [CORS](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) cho phần tử script. Với classic scripts từ các [origin](/en-US/docs/Glossary/Origin) khác, thuộc tính này điều khiển việc thông tin lỗi có được hiển thị hay không.
- {{domxref("HTMLScriptElement.defer")}}
  - : Giá trị boolean điều khiển cách script được thực thi. Với classic scripts, nếu thuộc tính `defer` được đặt thành `true`, script ngoài sẽ được thực thi sau khi tài liệu đã được phân tích xong, nhưng trước khi sự kiện {{domxref("Document/DOMContentLoaded_event", "DOMContentLoaded")}} được phát ra. Với [module scripts](/en-US/docs/Web/JavaScript/Guide/Modules), thuộc tính `defer` không có tác dụng.
- `HTMLScriptElement.event` {{deprecated_inline}}
  - : Chuỗi; một cách lỗi thời để đăng ký trình xử lý sự kiện trên phần tử trong tài liệu HTML.
- {{domxref("HTMLScriptElement.fetchPriority")}}
  - : Chuỗi tùy chọn biểu thị gợi ý cho trình duyệt về cách nó nên ưu tiên tìm nạp một script ngoài so với các script ngoài khác. Nếu giá trị này được cung cấp, nó phải là một trong các giá trị cho phép: `high` để tìm nạp với ưu tiên cao, `low` để tìm nạp với ưu tiên thấp, hoặc `auto` để cho biết không có ưu tiên nào (đây là mặc định). Nó phản ánh thuộc tính `fetchpriority` của phần tử {{HTMLElement("script")}}.
- {{domxref("HTMLScriptElement.innerText")}}
  - : Thuộc tính biểu diễn nội dung văn bản nội tuyến của phần tử {{HTMLElement("script")}} như thể nó là văn bản đã được hiển thị.
    Thuộc tính này chấp nhận một đối tượng {{domxref("TrustedScript")}} hoặc một chuỗi.
- {{domxref("HTMLScriptElement.integrity")}}
  - : Chuỗi chứa siêu dữ liệu nội tuyến mà trình duyệt có thể dùng để xác minh rằng tài nguyên đã được tìm nạp và không bị can thiệp ngoài mong muốn. Nó phản ánh thuộc tính `integrity` của phần tử {{HTMLElement("script")}}.
- {{domxref("HTMLScriptElement.noModule")}}
  - : Giá trị boolean nếu là `true` sẽ ngăn script được thực thi trong các trình duyệt hỗ trợ [ES modules](/en-US/docs/Web/JavaScript/Guide/Modules) - dùng để chạy script dự phòng trong các trình duyệt cũ không hỗ trợ JavaScript modules.
- {{domxref("HTMLScriptElement.referrerPolicy")}}
  - : Chuỗi phản ánh thuộc tính HTML [`referrerPolicy`](/en-US/docs/Web/HTML/Reference/Elements/script#referrerpolicy), cho biết referrer nào sẽ được dùng khi tìm nạp script và các lần tìm nạp do script đó thực hiện.
- {{domxref("HTMLScriptElement.src")}}
  - : {{domxref("TrustedScriptURL")}} hoặc chuỗi biểu thị URL của một script ngoài; có thể dùng như một lựa chọn thay thế cho việc nhúng script trực tiếp trong tài liệu.
    Nó phản ánh thuộc tính `src` của phần tử {{HTMLElement("script")}}.
- {{domxref("HTMLScriptElement.text")}}
  - : Thuộc tính biểu diễn nội dung văn bản nội tuyến của phần tử {{HTMLElement("script")}}.
    Thuộc tính này chấp nhận một đối tượng {{domxref("TrustedScript")}} hoặc một chuỗi.
    Nó hoạt động giống như thuộc tính [`textContent`](/en-US/docs/Web/API/HTMLScriptElement/textContent).
- {{domxref("HTMLScriptElement.textContent")}}
  - : Thuộc tính biểu diễn nội dung văn bản nội tuyến của phần tử {{HTMLElement("script")}}.
    Thuộc tính này được định nghĩa lại từ {{domxref("Node/textContent","Node")}} để hỗ trợ {{domxref("TrustedScript")}} như đầu vào.
    Trên phần tử này, nó hoạt động chính xác như thuộc tính [`text`](/en-US/docs/Web/API/HTMLScriptElement/text) .
- {{domxref("HTMLScriptElement.type")}}
  - : Chuỗi biểu thị kiểu của script.
    Nó phản ánh thuộc tính `type` của phần tử {{HTMLElement("script")}}.

## Phương thức tĩnh

- {{domxref("HTMLScriptElement.supports_static", "HTMLScriptElement.supports()")}}
  - : Trả về `true` nếu trình duyệt hỗ trợ script của kiểu đã chỉ định và `false` nếu không.
    Phương thức này cung cấp một cơ chế đơn giản và thống nhất để phát hiện tính năng liên quan đến script.

## Phương thức thể hiện

_Không có phương thức cụ thể; kế thừa phương thức từ phần tử cha, {{domxref("HTMLElement")}}._

## Sự kiện

_Không có sự kiện cụ thể; kế thừa sự kiện từ phần tử cha, {{domxref("HTMLElement")}}._

## Ví dụ

### Nhập script động

Hãy tạo một hàm nhập các script mới trong tài liệu bằng cách tạo một nút {{HTMLElement("script")}} _ngay trước_ phần tử {{HTMLElement("script")}} đang chứa đoạn mã sau (thông qua {{domxref("document.currentScript")}}).
Các script này sẽ được thực thi **bất đồng bộ**.
Để biết thêm chi tiết, xem các thuộc tính [`defer`](/en-US/docs/Web/API/HTMLScriptElement/defer) và [`async`](/en-US/docs/Web/API/HTMLScriptElement/async).

```js
function loadError(oError) {
  throw new URIError(`The script ${oError.target.src} didn't load correctly.`);
}

function prefixScript(url, onloadFunction) {
  const newScript = document.createElement("script");
  newScript.onerror = loadError;
  if (onloadFunction) {
    newScript.onload = onloadFunction;
  }
  document.currentScript.parentNode.insertBefore(
    newScript,
    document.currentScript,
  );
  newScript.src = url;
}
```

Hàm tiếp theo, thay vì chèn các script mới ngay trước phần tử {{domxref("document.currentScript")}}, sẽ nối chúng như con của thẻ {{HTMLElement("head")}}.

```js
function loadError(oError) {
  throw new URIError(`The script ${oError.target.src} didn't load correctly.`);
}

function affixScriptToHead(url, onloadFunction) {
  const newScript = document.createElement("script");
  newScript.onerror = loadError;
  if (onloadFunction) {
    newScript.onload = onloadFunction;
  }
  document.head.appendChild(newScript);
  newScript.src = url;
}
```

Ví dụ sử dụng:

```js
affixScriptToHead("myScript1.js");
affixScriptToHead("myScript2.js", () => {
  alert('The script "myScript2.js" has been correctly loaded.');
});
```

### Kiểm tra một kiểu script có được hỗ trợ hay không

{{domxref("HTMLScriptElement.supports_static", "HTMLScriptElement.supports()")}} cung cấp một cơ chế thống nhất để kiểm tra liệu trình duyệt có hỗ trợ các kiểu script cụ thể hay không.

Ví dụ dưới đây cho thấy cách kiểm tra hỗ trợ module, dùng sự tồn tại của thuộc tính `noModule` làm phương án dự phòng.

```js
function checkModuleSupport() {
  if ("supports" in HTMLScriptElement) {
    return HTMLScriptElement.supports("module");
  }
  return "noModule" in document.createElement("script");
}
```

Classic scripts được giả định là được hỗ trợ trên mọi trình duyệt.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("script")}}
- Phần tử HTML {{HTMLElement("noscript")}}
- {{domxref("document.currentScript")}}
- [Web Workers](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) (các đoạn mã tương tự script nhưng được thực thi trong [ngữ cảnh toàn cục khác](/en-US/docs/Web/API/DedicatedWorkerGlobalScope))

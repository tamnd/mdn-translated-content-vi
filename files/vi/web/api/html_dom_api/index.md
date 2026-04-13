---
title: HTML DOM API
slug: Web/API/HTML_DOM_API
page-type: web-api-overview
browser-compat: api.HTMLElement
---

{{DefaultAPISidebar("HTML DOM")}}

**HTML DOM API** được tạo thành từ các giao diện định nghĩa chức năng của từng {{Glossary("element", "phần tử")}} trong {{Glossary("HTML")}}, cũng như bất kỳ loại và giao diện hỗ trợ nào mà chúng dựa vào.

Các lĩnh vực chức năng được bao gồm trong HTML DOM API bao gồm:

- Truy cập và kiểm soát các phần tử HTML thông qua {{Glossary("DOM")}}.
- Truy cập và thao tác dữ liệu biểu mẫu.
- Tương tác với nội dung của hình ảnh 2D và ngữ cảnh của HTML {{HTMLElement("canvas")}}, ví dụ để vẽ lên chúng.
- Quản lý phương tiện được kết nối với các phần tử phương tiện HTML ({{HTMLElement("audio")}} và {{HTMLElement("video")}}).
- Kéo và thả nội dung trên các trang web.
- Truy cập lịch sử điều hướng trình duyệt.
- Các giao diện hỗ trợ và kết nối cho các API khác như [Web Components](/en-US/docs/Web/API/Web_components), {{DOMxRef("Web_Storage_API", "Web Storage", "", "1")}}, {{DOMxRef("Web_Workers_API", "Web Workers", "", "1")}}, {{DOMxRef("WebSockets_API", "WebSocket", "", "1")}}, và {{DOMxRef("Server-sent_events", "Server-sent events", "", "1")}}.

## Khái niệm và cách sử dụng HTML DOM

Trong bài viết này, chúng ta sẽ tập trung vào các phần của HTML DOM liên quan đến việc tương tác với các phần tử HTML.

### Cấu trúc tài liệu HTML

Document Object Model ({{Glossary("DOM")}}) là kiến trúc mô tả cấu trúc của {{domxref("document")}}; mỗi tài liệu được đại diện bởi một phiên bản của giao diện {{domxref("Document")}}. Một tài liệu, lần lượt, bao gồm cây phân cấp của các **nút**, trong đó nút là bản ghi cơ bản đại diện cho một đối tượng đơn lẻ trong tài liệu (chẳng hạn như phần tử hoặc nút văn bản).

Các nút không có khái niệm bao gồm nội dung thực sự được hiển thị trong tài liệu. Khái niệm cơ bản về nút có thể đại diện cho nội dung trực quan được giới thiệu bởi giao diện {{domxref("Element")}}.

Ví dụ, hãy xem xét tài liệu có hai phần tử, một trong số đó có thêm hai phần tử lồng bên trong:

![Structure of a document with elements inside a document in a window](dom-structure.svg)

### Giao diện phần tử HTML

Giao diện `Element` đã được điều chỉnh thêm để đại diện cụ thể cho các phần tử HTML bằng cách giới thiệu giao diện {{domxref("HTMLElement")}}, mà tất cả các lớp phần tử HTML cụ thể hơn đều kế thừa từ đó.

Giao diện `HTMLElement` là chung, tuy nhiên, chỉ cung cấp chức năng chung cho tất cả các phần tử HTML như ID của phần tử, tọa độ của nó, HTML tạo thành phần tử, thông tin về vị trí cuộn, v.v.

Cấu trúc kế thừa tổng thể cho các lớp phần tử HTML trông như sau:

![Hierarchy of interfaces for HTML elements](html-dom-hierarchy.svg)

## Đối tượng sử dụng HTML DOM

Các tính năng được cung cấp bởi HTML DOM là một trong những API được sử dụng phổ biến nhất trong bộ công cụ của nhà phát triển web. Tất cả các ứng dụng web ngoại trừ đơn giản nhất sẽ sử dụng một số tính năng của HTML DOM.

## Giao diện HTML DOM API

Phần lớn các giao diện tạo nên HTML DOM API ánh xạ gần như một-một với các phần tử HTML riêng lẻ, hoặc với một nhóm nhỏ các phần tử có chức năng tương tự.

### Giao diện phần tử HTML

Các giao diện này đại diện cho các phần tử HTML cụ thể (hoặc tập hợp các phần tử liên quan có cùng thuộc tính và phương thức).

- {{DOMxRef("HTMLAnchorElement")}}
- {{DOMxRef("HTMLAreaElement")}}
- {{DOMxRef("HTMLAudioElement")}}
- {{DOMxRef("HTMLBaseElement")}}
- {{DOMxRef("HTMLBodyElement")}}
- {{DOMxRef("HTMLBRElement")}}
- {{DOMxRef("HTMLButtonElement")}}
- {{DOMxRef("HTMLCanvasElement")}}
- {{DOMxRef("HTMLDataElement")}}
- {{DOMxRef("HTMLDataListElement")}}
- {{DOMxRef("HTMLDetailsElement")}}
- {{DOMxRef("HTMLDialogElement")}}
- {{DOMxRef("HTMLDirectoryElement")}}
- {{DOMxRef("HTMLDivElement")}}
- {{DOMxRef("HTMLDListElement")}}
- {{DOMxRef("HTMLElement")}}
- {{DOMxRef("HTMLEmbedElement")}}
- {{DOMxRef("HTMLFieldSetElement")}}
- {{DOMxRef("HTMLFormElement")}}
- {{DOMxRef("HTMLHRElement")}}
- {{DOMxRef("HTMLHeadElement")}}
- {{DOMxRef("HTMLHeadingElement")}}
- {{DOMxRef("HTMLHtmlElement")}}
- {{DOMxRef("HTMLIFrameElement")}}
- {{DOMxRef("HTMLImageElement")}}
- {{DOMxRef("HTMLInputElement")}}
- {{DOMxRef("HTMLLabelElement")}}
- {{DOMxRef("HTMLLegendElement")}}
- {{DOMxRef("HTMLLIElement")}}
- {{DOMxRef("HTMLLinkElement")}}
- {{DOMxRef("HTMLMapElement")}}
- {{DOMxRef("HTMLMediaElement")}}
- {{DOMxRef("HTMLMenuElement")}}
- {{DOMxRef("HTMLMetaElement")}}
- {{DOMxRef("HTMLMeterElement")}}
- {{DOMxRef("HTMLModElement")}}
- {{DOMxRef("HTMLObjectElement")}}
- {{DOMxRef("HTMLOListElement")}}
- {{DOMxRef("HTMLOptGroupElement")}}
- {{DOMxRef("HTMLOptionElement")}}
- {{DOMxRef("HTMLOutputElement")}}
- {{DOMxRef("HTMLParagraphElement")}}
- {{DOMxRef("HTMLPictureElement")}}
- {{DOMxRef("HTMLPreElement")}}
- {{DOMxRef("HTMLProgressElement")}}
- {{DOMxRef("HTMLQuoteElement")}}
- {{DOMxRef("HTMLScriptElement")}}
- {{DOMxRef("HTMLSelectElement")}}
- {{DOMxRef("HTMLSlotElement")}}
- {{DOMxRef("HTMLSourceElement")}}
- {{DOMxRef("HTMLSpanElement")}}
- {{DOMxRef("HTMLStyleElement")}}
- {{DOMxRef("HTMLTableCaptionElement")}}
- {{DOMxRef("HTMLTableCellElement")}}
- {{DOMxRef("HTMLTableColElement")}}
- {{DOMxRef("HTMLTableElement")}}
- {{DOMxRef("HTMLTableRowElement")}}
- {{DOMxRef("HTMLTableSectionElement")}}
- {{DOMxRef("HTMLTemplateElement")}}
- {{DOMxRef("HTMLTextAreaElement")}}
- {{DOMxRef("HTMLTimeElement")}}
- {{DOMxRef("HTMLTitleElement")}}
- {{DOMxRef("HTMLTrackElement")}}
- {{DOMxRef("HTMLUListElement")}}
- {{DOMxRef("HTMLUnknownElement")}}
- {{DOMxRef("HTMLVideoElement")}}

#### Giao diện phần tử HTML đã lỗi thời

- {{DOMxRef("HTMLMarqueeElement")}} {{deprecated_inline}}

#### Giao diện phần tử HTML đã lỗi thời hoàn toàn

- {{DOMxRef("HTMLFontElement")}} {{deprecated_inline}}
- {{DOMxRef("HTMLFrameElement")}} {{deprecated_inline}}
- {{DOMxRef("HTMLFrameSetElement")}} {{deprecated_inline}}

### Giao diện ứng dụng web và tích hợp trình duyệt

Các giao diện này cung cấp quyền truy cập vào cửa sổ trình duyệt và tài liệu chứa HTML, cũng như trạng thái của trình duyệt.

- {{DOMxRef("BarProp")}}
- {{DOMxRef("Navigator")}}
- {{DOMxRef("Window")}}

#### Giao diện ứng dụng web và tích hợp trình duyệt đã lỗi thời

- {{DOMxRef("External")}} {{deprecated_inline}}

#### Giao diện ứng dụng web và tích hợp trình duyệt đã lỗi thời hoàn toàn

- {{DOMxRef("Plugin")}} {{deprecated_inline}}
- {{DOMxRef("PluginArray")}} {{deprecated_inline}}

### Giao diện hỗ trợ biểu mẫu

Các giao diện này cung cấp cấu trúc và chức năng cần thiết bởi các phần tử được sử dụng để tạo và quản lý biểu mẫu.

- {{DOMxRef("FormDataEvent")}}
- {{DOMxRef("HTMLFormControlsCollection")}}
- {{DOMxRef("HTMLOptionsCollection")}}
- {{DOMxRef("RadioNodeList")}}
- {{DOMxRef("ValidityState")}}

### Giao diện canvas và hình ảnh

Các giao diện này đại diện cho các đối tượng được sử dụng bởi Canvas API cũng như phần tử {{HTMLElement("img")}} và {{HTMLElement("picture")}}.

- {{DOMxRef("CanvasGradient")}}
- {{DOMxRef("CanvasPattern")}}
- {{DOMxRef("CanvasRenderingContext2D")}}
- {{DOMxRef("ImageBitmap")}}
- {{DOMxRef("ImageBitmapRenderingContext")}}
- {{DOMxRef("ImageData")}}
- {{DOMxRef("OffscreenCanvas")}}
- {{DOMxRef("OffscreenCanvasRenderingContext2D")}}
- {{DOMxRef("Path2D")}}
- {{DOMxRef("TextMetrics")}}

### Giao diện phương tiện

Các giao diện phương tiện cung cấp quyền truy cập HTML vào nội dung của các phần tử phương tiện: {{HTMLElement("audio")}} và {{HTMLElement("video")}}.

- {{DOMxRef("AudioTrack")}}
- {{DOMxRef("AudioTrackList")}}
- {{DOMxRef("MediaError")}}
- {{DOMxRef("TextTrack")}}
- {{DOMxRef("TextTrackCue")}}
- {{DOMxRef("TextTrackCueList")}}
- {{DOMxRef("TextTrackList")}}
- {{DOMxRef("TimeRanges")}}
- {{DOMxRef("TrackEvent")}}
- {{DOMxRef("VideoTrack")}}
- {{DOMxRef("VideoTrackList")}}

### Giao diện kéo và thả

Các giao diện này được sử dụng bởi [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) để đại diện cho các mục có thể kéo riêng lẻ.

- {{DOMxRef("DataTransfer")}}
- {{DOMxRef("DataTransferItem")}}
- {{DOMxRef("DataTransferItemList")}}
- {{DOMxRef("DragEvent")}}

### Giao diện lịch sử trang

Các giao diện History API cho phép bạn truy cập thông tin về lịch sử trình duyệt.

- {{DOMxRef("BeforeUnloadEvent")}}
- {{DOMxRef("HashChangeEvent")}}
- {{DOMxRef("History")}}
- {{DOMxRef("Location")}}
- {{DOMxRef("PageRevealEvent")}}
- {{DOMxRef("PageSwapEvent")}}
- {{DOMxRef("PageTransitionEvent")}}
- {{DOMxRef("PopStateEvent")}}

### Giao diện Web Components

Các giao diện này được sử dụng bởi [Web Components API](/en-US/docs/Web/API/Web_components) để tạo và quản lý các phần tử tùy chỉnh có sẵn.

- {{DOMxRef("CustomElementRegistry")}}

### Giao diện hỗ trợ và phụ trợ khác

Các kiểu đối tượng hỗ trợ này được sử dụng theo nhiều cách khác nhau trong HTML DOM API. Ngoài ra, {{domxref("PromiseRejectionEvent")}} đại diện cho sự kiện được gửi khi {{jsxref("Promise")}} {{Glossary("JavaScript")}} bị từ chối.

- {{DOMxRef("DOMStringList")}}
- {{DOMxRef("DOMStringMap")}}
- {{DOMxRef("ErrorEvent")}}
- {{DOMxRef("HTMLAllCollection")}}
- {{DOMxRef("MimeType")}}
- {{DOMxRef("MimeTypeArray")}}
- {{DOMxRef("PromiseRejectionEvent")}}

### Giao diện thuộc về các API khác

Một số giao diện được định nghĩa về mặt kỹ thuật trong đặc tả HTML nhưng thực sự là một phần của các API khác.

#### Giao diện Web Storage

{{DOMxRef("Web_Storage_API", "Web Storage API", "", "1")}} cung cấp khả năng cho các trang web lưu trữ dữ liệu tạm thời hoặc vĩnh viễn trên thiết bị của người dùng.

- {{DOMxRef("Storage")}}
- {{DOMxRef("StorageEvent")}}

#### Giao diện Web Workers

Các giao diện này được sử dụng bởi {{DOMxRef("Web_Workers_API", "Web Workers API", "", "1")}}.

- {{DOMxRef("BroadcastChannel")}}
- {{DOMxRef("DedicatedWorkerGlobalScope")}}
- {{DOMxRef("MessageChannel")}}
- {{DOMxRef("MessageEvent")}}
- {{DOMxRef("MessagePort")}}
- {{DOMxRef("SharedWorker")}}
- {{DOMxRef("SharedWorkerGlobalScope")}}
- {{DOMxRef("Worker")}}
- {{DOMxRef("WorkerGlobalScope")}}
- {{DOMxRef("WorkerLocation")}}
- {{DOMxRef("WorkerNavigator")}}

#### Giao diện WebSocket

Các giao diện này được sử dụng bởi {{DOMxRef("WebSockets_API", "WebSockets API", "", "1")}}.

- {{DOMxRef("CloseEvent")}}
- {{DOMxRef("WebSocket")}}

#### Giao diện sự kiện gửi từ máy chủ

Giao diện {{domxref("EventSource")}} đại diện cho nguồn đã gửi hoặc đang gửi {{DOMxRef("Server-sent_events", "sự kiện gửi từ máy chủ", "", "1")}}.

- {{DOMxRef("EventSource")}}

## Ví dụ

Trong ví dụ này, sự kiện {{domxref("Element/input_event", "input")}} của phần tử {{HTMLElement("input")}} được theo dõi để cập nhật trạng thái của nút "submit" của biểu mẫu.

### JavaScript

```js
const nameField = document.getElementById("userName");
const sendButton = document.getElementById("sendButton");

sendButton.disabled = true;
// [note: this is disabled since it causes this article to always load with this example focused and scrolled into view]
// nameField.focus();

nameField.addEventListener("input", (event) => {
  const elem = event.target;
  const valid = elem.value.length !== 0;

  if (valid && sendButton.disabled) {
    sendButton.disabled = false;
  } else if (!valid && !sendButton.disabled) {
    sendButton.disabled = true;
  }
});
```

### HTML

```html
<p>Please provide the information below. Items marked with "*" are required.</p>
<form action="" method="get">
  <p>
    <label for="userName" required>Your name:</label>
    <input type="text" id="userName" /> (*)
  </p>
  <p>
    <label for="userEmail">Email:</label>
    <input type="email" id="userEmail" />
  </p>
  <input type="submit" value="Send" id="sendButton" />
</form>
```

### Kết quả

{{EmbedLiveSample("Examples", 640, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

### Tài liệu tham khảo

- [HTML elements reference](/en-US/docs/Web/HTML/Reference/Elements)
- [HTML attribute reference](/en-US/docs/Web/HTML/Reference/Attributes)
- {{DOMxRef("Document_Object_Model", "Document Object Model (DOM)", "", "1")}} reference

### Hướng dẫn

- [DOM scripting introduction](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting)

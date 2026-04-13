---
title: HTMLSourceElement
slug: Web/API/HTMLSourceElement
page-type: web-api-interface
browser-compat: api.HTMLSourceElement
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLSourceElement`** cung cấp các thuộc tính đặc biệt (ngoài giao diện đối tượng {{domxref("HTMLElement")}} thông thường mà nó cũng có sẵn thông qua kế thừa) để thao tác các phần tử {{htmlelement("source")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{domxref("HTMLElement")}}._

- {{domxref("HTMLSourceElement.height")}}
  - : Một số phản ánh thuộc tính HTML [`height`](/en-US/docs/Web/HTML/Reference/Elements/source#height), cho biết chiều cao của tài nguyên hình ảnh tính bằng pixel CSS. Thuộc tính chỉ có ý nghĩa nếu phần tử cha của {{HTMLElement("source")}} hiện tại là phần tử {{HTMLElement("picture")}}.
- {{domxref("HTMLSourceElement.media")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`media`](/en-US/docs/Web/HTML/Reference/Elements/source#media), chứa loại phương tiện dự định của tài nguyên phương tiện.
- {{domxref("HTMLSourceElement.sizes")}}
  - : Một chuỗi đại diện cho kích thước hình ảnh giữa các điểm ngắt.
- {{domxref("HTMLSourceElement.src")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`src`](/en-US/docs/Web/HTML/Reference/Elements/source#src), chứa URL của tài nguyên phương tiện. Thuộc tính {{domxref("HTMLSourceElement.src")}} chỉ có ý nghĩa khi phần tử {{HTMLElement("source")}} liên kết được lồng trong phần tử phương tiện là {{htmlelement("video")}} hoặc phần tử {{htmlelement("audio")}}. Nó không có ý nghĩa và bị bỏ qua khi nó được lồng trong phần tử {{HTMLElement("picture")}}.

    > [!NOTE]
    > Nếu thuộc tính `src` được cập nhật (cùng với bất kỳ sibling nào), phương thức `load` của {{domxref("HTMLMediaElement")}} cha nên được gọi khi xong, vì các phần tử `<source>` không được quét lại tự động.

- {{domxref("HTMLSourceElement.srcset")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/source#srcset), chứa danh sách các hình ảnh ứng cử viên, được phân tách bằng dấu phẩy (`,', U+002C COMMA`). Hình ảnh ứng cử viên là URL theo sau là `'w'` với chiều rộng của hình ảnh, hoặc `'x'` theo sau là mật độ pixel.
- {{domxref("HTMLSourceElement.type")}}
  - : Một chuỗi phản ánh thuộc tính HTML [`type`](/en-US/docs/Web/HTML/Reference/Elements/source#type), chứa loại tài nguyên phương tiện.
- {{domxref("HTMLSourceElement.width")}}
  - : Một số phản ánh thuộc tính HTML [`width`](/en-US/docs/Web/HTML/Reference/Elements/source#width), cho biết chiều rộng của tài nguyên hình ảnh tính bằng pixel CSS. Thuộc tính chỉ có ý nghĩa nếu phần tử cha của {{HTMLElement("source")}} hiện tại là phần tử {{HTMLElement("picture")}}.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ lớp cha {{domxref("HTMLElement")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML triển khai giao diện này: {{ HTMLElement("source") }}.
- Các HTML DOM API của các phần tử có thể chứa phần tử {{HTMLElement("source")}}: {{domxref("HTMLVideoElement")}}, {{domxref("HTMLAudioElement")}}, {{domxref("HTMLPictureElement")}}.

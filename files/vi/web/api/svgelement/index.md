---
title: SVGElement
slug: Web/API/SVGElement
page-type: web-api-interface
browser-compat: api.SVGElement
---

{{APIRef("SVG")}}

Tất cả các giao diện SVG DOM tương ứng trực tiếp với các phần tử trong ngôn ngữ SVG đều kế thừa từ giao diện `SVGElement`.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Cũng kế thừa các thuộc tính từ giao diện {{DOMxRef("Element")}}._

- {{DOMxRef("SVGElement.attributeStyleMap")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("StylePropertyMap")}} đại diện cho các khai báo của thuộc tính {{SVGAttr("style")}} của phần tử.
- {{DOMxRef("SVGElement.autofocus")}}
  - : Xác định liệu điều khiển có nên được lấy tiêu điểm khi trang tải, hoặc khi một {{htmlelement("dialog")}} hay [popover](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) được hiển thị hay không.
- {{DOMxRef("SVGElement.className")}} {{Deprecated_Inline}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("SVGAnimatedString")}} phản ánh giá trị của thuộc tính {{SVGAttr("class")}} trên phần tử đã cho, hoặc chuỗi rỗng nếu `class` không có. Thuộc tính này đã lỗi thời và có thể bị xóa trong phiên bản tương lai của đặc tả. Tác giả nên sử dụng {{DOMxRef("Element.classList")}} thay thế.
- {{DOMxRef("SVGElement.dataset")}} {{ReadOnlyInline}}
  - : Một đối tượng {{DOMxRef("DOMStringMap")}} cung cấp danh sách các cặp khóa/giá trị của các thuộc tính dữ liệu có tên tương ứng với các [thuộc tính dữ liệu tùy chỉnh](/en-US/docs/Web/HTML/How_to/Use_data_attributes) gắn liền với phần tử. Các thuộc tính này cũng có thể được định nghĩa trong SVG bằng các thuộc tính có dạng {{SVGAttr("data-*")}}, trong đó `*` là tên khóa của cặp. Cơ chế này hoạt động giống như thuộc tính {{DOMxRef("HTMLElement.dataset")}} của HTML và thuộc tính toàn cục [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*) của HTML.
- {{DOMxRef("SVGElement.nonce")}}
  - : Trả về số dùng một lần mã hóa được Content Security Policy sử dụng để xác định liệu một yêu cầu tải tài nguyên có được phép tiến hành hay không.
- {{DOMxRef("SVGElement.ownerSVGElement")}} {{ReadOnlyInline}}
  - : Một {{DOMxRef("SVGSVGElement")}} tham chiếu đến phần tử {{SVGElement("svg")}} tổ tiên gần nhất. `null` nếu phần tử đã cho là phần tử `<svg>` ngoài cùng.
- {{DOMxRef("SVGElement.style")}}
  - : Một {{DOMxRef("CSSStyleDeclaration")}} đại diện cho các khai báo của thuộc tính {{SVGAttr("style")}} của phần tử.
- {{DOMxRef("SVGElement.tabIndex")}}
  - : Vị trí của phần tử trong thứ tự tab.
- {{DOMxRef("SVGElement.viewportElement")}} {{ReadOnlyInline}}
  - : `SVGElement` đã thiết lập khung nhìn hiện tại. Thường là phần tử {{SVGElement("svg")}} tổ tiên gần nhất. `null` nếu phần tử đã cho là phần tử `<svg>` ngoài cùng.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{DOMxRef("Element")}}._

- {{DOMxRef("SVGElement.blur()")}}
  - : Xóa tiêu điểm bàn phím khỏi phần tử đang có tiêu điểm.
- {{DOMxRef("SVGElement.focus()")}}
  - : Đặt phần tử làm tiêu điểm bàn phím hiện tại.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc gán trình xử lý sự kiện cho thuộc tính `on...` tương ứng.

- [`abort`](/en-US/docs/Web/API/SVGElement/abort_event)
  - : Được kích hoạt khi quá trình tải trang bị dừng trước khi phần tử SVG được phép tải hoàn toàn.
- [`error`](/en-US/docs/Web/API/SVGElement/error_event)
  - : Được kích hoạt khi phần tử SVG không tải được đúng cách hoặc khi có lỗi xảy ra trong quá trình thực thi script.
- [`load`](/en-US/docs/Web/API/SVGElement/load_event)
  - : Được kích hoạt trên `SVGElement` khi nó được tải trong trình duyệt.
- [`resize`](/en-US/docs/Web/API/SVGElement/resize_event)
  - : Được kích hoạt khi tài liệu SVG đang được thay đổi kích thước.
- [`scroll`](/en-US/docs/Web/API/SVGElement/scroll_event)
  - : Được kích hoạt khi khung nhìn tài liệu SVG đang được dịch chuyển theo trục X và/hoặc Y.
- [`unload`](/en-US/docs/Web/API/SVGElement/unload_event)
  - : Được kích hoạt khi triển khai DOM xóa tài liệu SVG khỏi cửa sổ hoặc khung.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính HTML [`data-*`](/en-US/docs/Web/HTML/Reference/Global_attributes/data-*)
- Thuộc tính SVG {{SVGAttr("data-*")}}
- [Sử dụng thuộc tính dữ liệu tùy chỉnh trong HTML](/en-US/docs/Web/HTML/How_to/Use_data_attributes)

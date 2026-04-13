---
title: SVGAnimationElement
slug: Web/API/SVGAnimationElement
page-type: web-api-interface
browser-compat: api.SVGAnimationElement
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimationElement`** là giao diện cơ sở cho tất cả các giao diện phần tử hoạt hình: {{domxref("SVGAnimateElement")}}, {{domxref("SVGSetElement")}}, {{domxref("SVGAnimateColorElement")}}, {{domxref("SVGAnimateMotionElement")}} và {{domxref("SVGAnimateTransformElement")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGAnimationElement.requiredExtensions")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGStringList")}} phản ánh thuộc tính {{SVGAttr("requiredExtensions")}} của phần tử đã cho.
- {{domxref("SVGAnimationElement.systemLanguage")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGStringList")}} phản ánh thuộc tính {{SVGAttr("systemLanguage")}} của phần tử đã cho.
- {{domxref("SVGAnimationElement.targetElement")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGElement")}} biểu thị phần tử đang được tạo hoạt hình. Nếu không có phần tử đích nào đang được tạo hoạt hình (ví dụ: vì {{SVGAttr("href")}} chỉ định một phần tử không xác định), giá trị trả về là `null`.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ cha của nó, {{domxref("SVGElement")}}._

- {{domxref("SVGAnimationElement.getStartTime()")}}
  - : Trả về một số thực biểu thị thời gian bắt đầu, tính bằng giây, cho khoảng hiện tại của phần tử hoạt hình này, nếu nó tồn tại, bất kể khoảng đó đã bắt đầu hay chưa. Nếu không có khoảng hiện tại, một {{domxref("DOMException")}} với mã `INVALID_STATE_ERR` được ném ra.
- {{domxref("SVGAnimationElement.getCurrentTime()")}}
  - : Trả về một số thực biểu thị thời gian hiện tại tính bằng giây so với thời điểm không của vùng chứa thời gian đã cho.
- {{domxref("SVGAnimationElement.getSimpleDuration()")}}
  - : Trả về một số thực biểu thị số giây cho thời lượng đơn giản của hoạt hình này. Nếu thời lượng đơn giản không xác định (ví dụ: thời gian kết thúc là vô hạn), một {{domxref("DOMException")}} với mã `NOT_SUPPORTED_ERR` được ném ra.
- {{domxref("SVGAnimationElement.beginElement()")}}
  - : Tạo một thời điểm bắt đầu cho thời gian hiện tại. Thời điểm mới được thêm vào danh sách thời điểm bắt đầu. Hành vi của phương thức này tương đương với `beginElementAt(0)`.
- {{domxref("SVGAnimationElement.beginElementAt()")}}
  - : Tạo một thời điểm bắt đầu cho thời gian hiện tại cộng với độ lệch đã chỉ định. Thời điểm mới được thêm vào danh sách thời điểm bắt đầu.
- {{domxref("SVGAnimationElement.endElement()")}}
  - : Tạo một thời điểm kết thúc cho thời gian hiện tại. Thời điểm mới được thêm vào danh sách thời điểm kết thúc. Hành vi của phương thức này tương đương với `endElementAt(0)`.
- {{domxref("SVGAnimationElement.endElementAt()")}}
  - : Tạo một thời điểm kết thúc cho thời gian hiện tại cộng với độ lệch đã chỉ định. Thời điểm mới được thêm vào danh sách thời điểm kết thúc.

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính trình xử lý `on...` của giao diện này.

- [`beginEvent`](/en-US/docs/Web/API/SVGAnimationElement/beginEvent_event)
  - : Được kích hoạt khi dòng thời gian cục bộ của phần tử bắt đầu phát.
- [`endEvent`](/en-US/docs/Web/API/SVGAnimationElement/endEvent_event)
  - : Được kích hoạt khi đạt đến phần cuối hoạt động của hoạt hình.
- [`repeatEvent`](/en-US/docs/Web/API/SVGAnimationElement/repeatEvent_event)
  - : Được kích hoạt khi dòng thời gian cục bộ của phần tử lặp lại. Nó sẽ được kích hoạt mỗi lần phần tử lặp lại, sau lần lặp đầu tiên.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

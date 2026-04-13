---
title: Web Animations API
slug: Web/API/Web_Animations_API
page-type: web-api-overview
spec-urls: https://drafts.csswg.org/web-animations/
---

{{DefaultAPISidebar("Web Animations")}}

**Web Animations API** cho phép đồng bộ hóa và định thời các thay đổi đối với cách trình bày của một trang web, tức là hoạt ảnh của các phần tử DOM. Nó thực hiện điều đó bằng cách kết hợp hai mô hình: Timing Model và Animation Model.

## Khái niệm và cách dùng

Web Animations API cung cấp một ngôn ngữ chung để trình duyệt và nhà phát triển mô tả các hoạt ảnh trên phần tử DOM. Để biết thêm về các khái niệm nền tảng và cách sử dụng API này, hãy đọc [Using the Web Animations API](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API).

## Các giao diện của Web Animations

- {{domxref("Animation")}}
  - : Cung cấp các điều khiển phát lại và một timeline cho một nút hoặc nguồn hoạt ảnh. Có thể nhận một đối tượng được tạo bằng hàm tạo {{domxref("KeyframeEffect.KeyframeEffect", "KeyframeEffect()")}}.
- {{domxref("KeyframeEffect")}}
  - : Mô tả các tập hợp thuộc tính và giá trị có thể làm hoạt ảnh, được gọi là **keyframes**, cùng các tùy chọn định thời của chúng. Sau đó chúng có thể được phát bằng hàm tạo {{domxref("Animation.Animation", "Animation()")}}.
- {{domxref("AnimationTimeline")}}
  - : Đại diện cho timeline của hoạt ảnh. Giao diện này tồn tại để định nghĩa các tính năng timeline và không được nhà phát triển truy cập trực tiếp.
- {{domxref("AnimationEvent")}}
  - : Thuộc mô-đun [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations), ghi nhận tên hoạt ảnh và thời gian đã trôi qua.
- {{domxref("DocumentTimeline")}}
  - : Đại diện cho các timeline hoạt ảnh, bao gồm timeline tài liệu mặc định (được truy cập bằng thuộc tính {{domxref("Document.timeline")}}).

## Mở rộng cho các giao diện khác

Web Animations API bổ sung tính năng cho {{domxref("document")}} và {{domxref("element")}}.

### Mở rộng cho giao diện `Document`

- {{domxref("document.timeline")}}
  - : Đối tượng `DocumentTimeline` đại diện cho timeline tài liệu mặc định.
- {{domxref("document.getAnimations()")}}
  - : Trả về một mảng các đối tượng {{domxref("Animation")}} hiện đang có hiệu lực trên các phần tử trong `document`.

### Mở rộng cho giao diện `Element`

- {{domxref("Element.animate()")}}
  - : Một phương thức viết tắt để tạo và phát một hoạt ảnh trên một phần tử. Nó trả về một thể hiện đối tượng {{domxref("Animation")}} được tạo.
- {{domxref("Element.getAnimations()")}}
  - : Trả về một mảng các đối tượng {{domxref("Animation")}} hiện đang ảnh hưởng đến một phần tử hoặc được lên lịch để làm như vậy trong tương lai.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Thuộc tính viết tắt CSS {{cssxref("animation")}}
- Thuộc tính CSS {{cssxref("animation-timeline")}}
- [Using the Web Animations API](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API)
- [Using CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using)
- Mô-đun [CSS animations](/en-US/docs/Web/CSS/Guides/Animations)
- Mô-đun [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)

---
title: Animation
slug: Web/API/Animation
page-type: web-api-interface
browser-compat: api.Animation
---

{{ APIRef("Web Animations") }}

Giao diện **`Animation`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) biểu diễn một bộ phát hoạt ảnh đơn lẻ và cung cấp các điều khiển phát cũng như một timeline cho một nút hoặc nguồn hoạt ảnh.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("Animation.Animation()", "Animation()")}}
  - : Tạo một thể hiện đối tượng `Animation` mới.

## Thuộc tính thể hiện

- {{domxref("Animation.currentTime")}}
  - : Giá trị thời gian hiện tại của hoạt ảnh, tính bằng mili giây, dù đang chạy hay đang tạm dừng. Nếu hoạt ảnh không có {{domxref("AnimationTimeline", "timeline")}}, đang không hoạt động, hoặc chưa từng được phát, giá trị của nó là `null`.
- {{domxref("Animation.effect")}}
  - : Lấy và đặt {{domxref("AnimationEffect")}} được liên kết với hoạt ảnh này. Thông thường đây sẽ là một đối tượng {{domxref("KeyframeEffect")}}.
- {{domxref("Animation.finished")}} {{ReadOnlyInline}}
  - : Trả về Promise đã hoàn tất hiện tại của hoạt ảnh này.
- {{domxref("Animation.id")}}
  - : Lấy và đặt chuỗi `String` dùng để định danh hoạt ảnh.
- {{domxref("Animation.overallProgress")}} {{ReadOnlyInline}}
  - : Trả về một số từ `0` đến `1` biểu thị mức độ tiến triển tổng thể của hoạt ảnh hướng tới trạng thái hoàn tất.
- {{domxref("Animation.pending")}} {{ReadOnlyInline}}
  - : Cho biết hoạt ảnh hiện đang chờ một thao tác không đồng bộ như bắt đầu phát hoặc tạm dừng một hoạt ảnh đang chạy hay không.
- {{domxref("Animation.playState")}} {{ReadOnlyInline}}
  - : Trả về một giá trị liệt kê mô tả trạng thái phát lại của hoạt ảnh.
- {{domxref("Animation.playbackRate")}}
  - : Lấy hoặc đặt tốc độ phát của hoạt ảnh.
- {{domxref("Animation.ready")}} {{ReadOnlyInline}}
  - : Trả về Promise sẵn sàng hiện tại của hoạt ảnh này.
- {{domxref("Animation.replaceState")}} {{ReadOnlyInline}}
  - : Cho biết hoạt ảnh đang hoạt động, đã bị tự động gỡ bỏ sau khi được thay thế bởi hoạt ảnh khác, hay đã được lưu cố định rõ ràng bằng cách gọi {{domxref("Animation.persist()")}}.
- {{domxref("Animation.startTime")}}
  - : Lấy hoặc đặt thời điểm đã lên lịch để việc phát lại của hoạt ảnh bắt đầu.
- {{domxref("Animation.timeline")}}
  - : Lấy hoặc đặt {{domxref("AnimationTimeline", "timeline")}} được liên kết với hoạt ảnh này.

## Phương thức thể hiện

- {{domxref("Animation.cancel()")}}
  - : Xóa toàn bộ {{domxref("KeyframeEffect", "keyframeEffects")}} do hoạt ảnh này tạo ra và hủy quá trình phát của nó.
- {{domxref("Animation.commitStyles()")}}
  - : Ghi trạng thái kiểu hiện tại của hoạt ảnh vào thuộc tính `style` của phần tử đang được hoạt ảnh hóa, ngay cả sau khi hoạt ảnh đó đã bị gỡ bỏ. Việc này sẽ khiến trạng thái kiểu hiện tại được ghi vào phần tử dưới dạng các thuộc tính bên trong thuộc tính `style`.
- {{domxref("Animation.finish()")}}
  - : Di chuyển tới một trong hai đầu của hoạt ảnh, tùy thuộc vào việc hoạt ảnh đang phát hay đang phát ngược.
- {{domxref("Animation.pause()")}}
  - : Tạm ngừng việc phát hoạt ảnh.
- {{domxref("Animation.persist()")}}
  - : Lưu cố định hoạt ảnh một cách rõ ràng, ngăn nó bị [tự động gỡ bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations) khi một hoạt ảnh khác thay thế nó.
- {{domxref("Animation.play()")}}
  - : Bắt đầu hoặc tiếp tục phát hoạt ảnh, hoặc bắt đầu lại hoạt ảnh nếu trước đó nó đã hoàn tất.
- {{domxref("Animation.reverse()")}}
  - : Đảo ngược hướng phát lại, dừng ở đầu hoạt ảnh. Nếu hoạt ảnh đã hoàn tất hoặc chưa từng được phát, nó sẽ phát từ cuối về đầu.
- {{domxref("Animation.updatePlaybackRate()")}}
  - : Đặt tốc độ của hoạt ảnh sau khi đồng bộ hóa vị trí phát của nó trước.

## Sự kiện

- {{domxref("Animation.cancel_event", "cancel")}}
  - : Được kích hoạt khi phương thức {{domxref("Animation.cancel()")}} được gọi hoặc khi hoạt ảnh chuyển sang trạng thái phát `"idle"` từ một trạng thái khác.
- {{domxref("Animation.finish_event", "finish")}}
  - : Được kích hoạt khi hoạt ảnh phát xong.
- {{domxref("animation.remove_event", "remove")}}
  - : Được kích hoạt khi trình duyệt [tự động gỡ bỏ](/en-US/docs/Web/API/Web_Animations_API/Using_the_Web_Animations_API#automatically_removing_filling_animations) hoạt ảnh.

## Các lưu ý về khả năng truy cập

Hoạt ảnh nhấp nháy và chớp sáng có thể gây vấn đề cho những người có các mối quan ngại về nhận thức như Rối loạn tăng động giảm chú ý (ADHD). Ngoài ra, một số kiểu chuyển động có thể là tác nhân khởi phát cho rối loạn tiền đình, động kinh và đau nửa đầu, cũng như chứng nhạy cảm scotopic.

Hãy cân nhắc cung cấp một cơ chế để tạm dừng hoặc vô hiệu hóa hoạt ảnh, đồng thời dùng [truy vấn phương tiện Reduced Motion](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) (hoặc [user agent client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) tương đương {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}}) để tạo trải nghiệm phù hợp hơn cho người dùng đã thể hiện mong muốn không dùng các trải nghiệm có chuyển động.

- [Designing Safer Web Animation For Motion Sensitivity · An A List Apart Article](https://alistapart.com/article/designing-safer-web-animation-for-motion-sensitivity/)
- [An Introduction to the Reduced Motion Media Query | CSS-Tricks](https://css-tricks.com/introduction-reduced-motion-media-query/)
- [Responsive Design for Motion | WebKit](https://webkit.org/blog/7551/responsive-design-for-motion/)
- [MDN Understanding WCAG, Guideline 2.2 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.2_%e2%80%94_enough_time_provide_users_enough_time_to_read_and_use_content)
- [Understanding Success Criterion 2.2.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-pause.html)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)

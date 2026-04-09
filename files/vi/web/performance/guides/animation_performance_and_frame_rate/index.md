---
title: Hiệu năng hoạt ảnh và tốc độ khung hình
short-title: Hoạt ảnh và tốc độ khung hình
slug: Web/Performance/Guides/Animation_performance_and_frame_rate
page-type: guide
sidebar: performancesidebar
---

Hoạt ảnh trên web có thể được thực hiện qua {{domxref('SVGAnimationElement', 'SVG')}}, {{domxref('window.requestAnimationFrame','JavaScript')}}, bao gồm {{htmlelement('canvas')}} và {{domxref('WebGL_API', 'WebGL')}}, CSS {{cssxref('animation')}}, {{htmlelement('video')}}, ảnh GIF động và thậm chí cả ảnh PNG động và các kiểu ảnh khác. Chi phí hiệu năng của việc hoạt ảnh một thuộc tính CSS có thể khác nhau giữa các thuộc tính, và việc hoạt ảnh các thuộc tính CSS tốn kém có thể dẫn đến {{glossary('jank')}} khi trình duyệt vật lộn để đạt được {{glossary("FPS", "tốc độ khung hình")}} mượt mà.

Với media động, chẳng hạn video và ảnh GIF động, mối quan tâm hiệu năng chính là kích thước tệp - tải tệp đủ nhanh để không ảnh hưởng tiêu cực đến hiệu năng là vấn đề lớn nhất. Các hoạt ảnh dựa trên mã, dù là CSS, SVG, \<canvas>, WebGL hay các hoạt ảnh JavaScript khác, có thể gây ra vấn đề hiệu năng ngay cả khi dung lượng băng thông nhỏ. Những hoạt ảnh này có thể tiêu tốn CPU và/hoặc gây giật.

Người dùng kỳ vọng mọi tương tác giao diện phải mượt và mọi giao diện phải phản hồi tốt. Hoạt ảnh có thể giúp trang web tạo cảm giác nhanh hơn và phản hồi hơn, nhưng hoạt ảnh cũng có thể làm trang web có cảm giác chậm và giật nếu không được thực hiện đúng. Giao diện người dùng phản hồi tốt có tốc độ khung hình 60 khung hình mỗi giây (fps). Mặc dù không phải lúc nào cũng có thể giữ được 60fps, việc duy trì tốc độ khung hình cao và ổn định cho tất cả các hoạt ảnh là rất quan trọng.

Với [CSS animations](/en-US/docs/Web/CSS/Guides/Animations/Using), bạn chỉ định một số [keyframes](/en-US/docs/Web/CSS/Reference/At-rules/@keyframes), mỗi keyframe dùng CSS để xác định diện mạo của phần tử ở một giai đoạn cụ thể của hoạt ảnh. Trình duyệt tạo hoạt ảnh như một quá trình chuyển tiếp từ keyframe này sang keyframe tiếp theo.

So với việc hoạt ảnh phần tử bằng JavaScript, CSS animations có thể dễ tạo hơn. Chúng cũng có thể cho hiệu năng tốt hơn, vì chúng cho trình duyệt kiểm soát nhiều hơn về thời điểm kết xuất khung hình, và bỏ qua khung hình nếu cần.

Tuy nhiên, chi phí hiệu năng của việc sửa đổi một thuộc tính CSS có thể khác nhau giữa các thuộc tính. Người ta thường công nhận rằng 60 khung hình mỗi giây là tốc độ mà hoạt ảnh sẽ trông mượt. Với tốc độ 60 khung hình mỗi giây, trình duyệt có 16,7 mili giây để thực thi script, tính toán lại style và layout nếu cần, và vẽ lại vùng đang được cập nhật. Script chậm và việc hoạt ảnh các thuộc tính CSS tốn kém có thể dẫn đến [jank](/en-US/docs/Glossary/Jank) khi trình duyệt vật lộn để đạt được tốc độ khung hình mượt.

## Waterfall kết xuất

Quá trình mà trình duyệt dùng để vẽ các thay đổi lên một trang khi một phần tử đang hoạt ảnh các thuộc tính CSS có thể được mô tả như một waterfall gồm các bước sau:

![Lưu đồ của CSS rendering waterfall. Theo thứ tự, các bước là tính toán lại style, layout, và paint.](css-rendering-waterfall.png)

1. **Tính toán lại Style**: khi một thuộc tính của phần tử thay đổi, trình duyệt phải tính toán lại các style đã tính toán.
2. **Layout**: tiếp theo, trình duyệt dùng các style đã tính toán để xác định vị trí và hình học cho các phần tử. Thao tác này được gọi là "layout" nhưng đôi khi cũng được gọi là "reflow".
3. **Paint**: cuối cùng, trình duyệt cần vẽ lại các phần tử lên màn hình. Một bước cuối không được hiển thị trong chuỗi này: trang có thể được chia thành nhiều lớp, mỗi lớp được vẽ độc lập rồi sau đó kết hợp trong một quá trình gọi là "Composition".

Chuỗi này cần nằm gọn trong một khung hình duy nhất, vì màn hình sẽ không được cập nhật cho đến khi nó hoàn tất.

## Chi phí thuộc tính CSS

Trong ngữ cảnh của waterfall kết xuất, một số thuộc tính đắt hơn những thuộc tính khác:

- Các thuộc tính ảnh hưởng đến **hình học** hoặc **vị trí** của một phần tử sẽ kích hoạt:
  - tính toán lại style
  - layout
  - repaint

  Ví dụ: {{cssxref("left")}}, {{cssxref("max-width")}}, {{cssxref("border-width")}}, {{cssxref("margin-left")}}, {{cssxref("font-size")}}

- Các thuộc tính _không_ ảnh hưởng đến hình học hoặc vị trí và _không_ được kết xuất trong lớp riêng của chúng thì _không_ kích hoạt layout. Chúng sẽ kích hoạt:
  - tính toán lại style
  - repaint

  Ví dụ: {{cssxref("color")}}

- Các thuộc tính được kết xuất trong **lớp riêng** của chúng thậm chí không kích hoạt repaint, vì cập nhật được xử lý trong **composition**. Chúng sẽ kích hoạt:
  - tính toán lại style

  Ví dụ: {{cssxref("transform")}}, {{cssxref("opacity")}}

## Công cụ dành cho nhà phát triển

Hầu hết các trình duyệt web đều bao gồm công cụ cung cấp thông tin chi tiết về công việc mà trình duyệt đang làm khi nó hoạt ảnh các phần tử của một trang. Bằng cách dùng các công cụ này, bạn có thể đo tốc độ khung hình hoạt ảnh của một ứng dụng và chẩn đoán các nút thắt hiệu năng nếu có.

- [Chrome performance tools](https://developer.chrome.com/docs/devtools/#performance)
- [Firefox performance tools](https://firefox-source-docs.mozilla.org/devtools-user/performance/)

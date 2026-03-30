---
title: blink element (<blink> tag)
slug: Glossary/blink_element
page-type: glossary-definition
sidebar: glossarysidebar
---

**Phần tử `<blink>`** (thẻ blink) là một tính năng HTML lỗi thời không còn được các trình duyệt web hỗ trợ và không còn được ghi chép trên MDN. Nó được sử dụng để làm cho nội dung văn bản nhấp nháy liên tục (sáng và tắt).

Phần tử `<blink>` được sử dụng như thế này:

```html example-bad
<blink>In ancient browsers, I may have blinked</blink>
```

## Lịch sử ngắn gọn

Vào những ngày đầu của web (đầu đến giữa những năm 90), có rất ít tính năng có sẵn để tạo kiểu cho trang web. Đặc tả [CSS](/en-US/docs/Web/CSS) (phiên bản 1) lần đầu tiên được phát hành vào năm 1996 và không được các trình duyệt chấp nhận nhất quán cho đến nhiều năm sau. Trước CSS, các trình duyệt đã thử nghiệm nhiều tính năng để làm nổi bật các phần văn bản cụ thể và thu hút sự chú ý của người dùng. Phần tử `<blink>` là một trong số đó, được giới thiệu trong các phiên bản đầu của [Netscape Navigator](/en-US/docs/Glossary/Netscape_Navigator); phần tử {{htmlelement("marquee")}} của [Internet Explorer](/en-US/docs/Glossary/Microsoft_Internet_Explorer) là một ví dụ khác.

Phần tử `<blink>` rõ ràng được tạo ra sau một cuộc trò chuyện trong một quán bar ở Mountain View giữa kỹ sư Netscape [Lou Montulli](https://en.wikipedia.org/wiki/Lou_Montulli) và các đồng nghiệp. Khi ông vào văn phòng sáng hôm sau, ông thấy rằng một trong những đồng nghiệp đã thức cả đêm và triển khai nó ([đọc câu chuyện ở đây](https://web.archive.org/web/20220331020029/http://www.montulli.org/theoriginofthe%3Cblink%3Etag)).

Mặc dù ban đầu được ưa chuộng, `<blink>` trở nên bị chỉ trích nhiều vì bị lạm dụng; nhiều người thấy nó gây khó chịu. Quan trọng hơn, nó làm giảm khả năng đọc và có thể đặc biệt gây vấn đề cho người dùng bị khiếm khuyết thị giác hoặc [rối loạn nhận thức](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility) như động kinh hoặc ADHD. Nó có thể gây mất phương hướng hoặc, trong trường hợp xấu nhất, thậm chí [kích hoạt co giật](/en-US/docs/Web/Accessibility/Guides/Seizure_disorders).

`<blink>` chưa bao giờ được xác định đúng cách và chưa bao giờ đạt được hỗ trợ đáng kể trên nhiều trình duyệt. Nó có thể được xem là một mảnh lịch sử web.

## Các giải pháp thay thế

- Thuộc tính CSS {{cssxref("text-decoration-line")}} có giá trị `blink` có thể có tác dụng tương tự, nhưng hầu hết các trình duyệt hiện đại bỏ qua nó.
- Phương thức JavaScript {{jsxref("String.blink()")}} bọc một chuỗi văn bản trong thẻ `<blink></blink>` nhưng, như đã thảo luận trước đó, phần tử này không còn được hỗ trợ ở bất kỳ đâu.
- [Hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations) vẫn có thể được sử dụng để tạo văn bản nhấp nháy. Tuy nhiên, bạn nên tránh văn bản nhấp nháy trên trang web vì các lý do đã thảo luận ở trên.

## Xem thêm

- [Blink element](https://en.wikipedia.org/wiki/Blink_element) trên Wikipedia
- [WCAG 2.2.2: Pause, Stop, Hide](https://www.w3.org/WAI/WCAG21/Understanding/pause-stop-hide)
- [WCAG 2.3.1: Three Flashes or Below Threshold](https://www.w3.org/WAI/WCAG21/Understanding/three-flashes-or-below-threshold)

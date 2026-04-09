---
title: <animate>
slug: Web/SVG/Reference/Element/animate
page-type: svg-element
browser-compat: svg.elements.animate
sidebar: svgref
---

Phần tử **`<animate>`** của [SVG](/en-US/docs/Web/SVG) cung cấp một cách để hoạt ảnh hóa một thuộc tính của phần tử theo thời gian.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

Phần tử này chỉ bao gồm các thuộc tính toàn cục.

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGAnimateElement")}}.

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
  margin: 0;
  padding: 0;
}
```

```html
<svg viewBox="0 0 10 10" xmlns="http://www.w3.org/2000/svg">
  <rect width="10" height="10">
    <animate
      attributeName="rx"
      values="0;5;0"
      dur="10s"
      repeatCount="indefinite" />
  </rect>
</svg>
```

{{EmbedLiveSample('Example', 150, '100%')}}

## Mối quan tâm về khả năng truy cập

Hoạt ảnh nhấp nháy và chớp sáng có thể gây vấn đề cho những người có các mối lo nhận thức như Rối loạn Tăng động Giảm chú ý (ADHD). Ngoài ra, một số kiểu chuyển động có thể kích hoạt các rối loạn tiền đình, động kinh, và chứng đau nửa đầu cũng như độ nhạy Scotopic.

Hãy cân nhắc cung cấp một cơ chế để tạm dừng hoặc vô hiệu hóa hoạt ảnh, đồng thời sử dụng [Truy vấn phương tiện Giảm chuyển động](/en-US/docs/Web/CSS/Reference/At-rules/@media/prefers-reduced-motion) hoặc một [User Agent client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) tương đương {{HTTPHeader("Sec-CH-Prefers-Reduced-Motion")}} để tạo trải nghiệm bổ sung cho người dùng đã thể hiện rằng họ không muốn trải nghiệm có hoạt ảnh.

- [Designing Safer Web Animation For Motion Sensitivity · An A List Apart Article](https://alistapart.com/article/designing-safer-web-animation-for-motion-sensitivity/)
- [An Introduction to the Reduced Motion Media Query | CSS-Tricks](https://css-tricks.com/introduction-reduced-motion-media-query/)
- [Responsive Design for Motion | WebKit](https://webkit.org/blog/7551/responsive-design-for-motion/)
- [MDN Understanding WCAG, Guideline 2.2 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.2_%e2%80%94_enough_time_provide_users_enough_time_to_read_and_use_content)
- [Understanding Success Criterion 2.2.2 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/time-limits-pause.html)

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

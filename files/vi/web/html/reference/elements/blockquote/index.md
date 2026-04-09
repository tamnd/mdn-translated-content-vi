---
title: "<blockquote>: Phần tử Trích dẫn khối"
slug: Web/HTML/Reference/Elements/blockquote
page-type: html-element
browser-compat: html.elements.blockquote
sidebar: htmlsidebar
---

Phần tử **`<blockquote>`** trong [HTML](/en-US/docs/Web/HTML) cho biết rằng văn bản được bao gồm là một trích dẫn mở rộng. Thông thường, điều này được hiển thị trực quan bằng cách thụt lề (xem [Ghi chú](#usage_notes) để biết cách thay đổi). URL của nguồn trích dẫn có thể được cung cấp bằng thuộc tính `cite`, trong khi đại diện văn bản của nguồn có thể được cung cấp bằng phần tử {{HTMLElement("cite")}}.

{{InteractiveExample("HTML Demo: &lt;blockquote&gt;", "tabbed-standard")}}

```html interactive-example
<div>
  <blockquote cite="https://www.huxley.net/bnw/four.html">
    <p>
      Words can be like X-rays, if you use them properly—they'll go through
      anything. You read and you're pierced.
    </p>
  </blockquote>
  <p>—Aldous Huxley, <cite>Brave New World</cite></p>
</div>
```

```css interactive-example
div:has(> blockquote) {
  background-color: #ededed;
  margin: 10px auto;
  padding: 15px;
  border-radius: 5px;
}

blockquote p::before {
  content: "\201C";
}

blockquote p::after {
  content: "\201D";
}

blockquote + p {
  text-align: right;
}
```

## Thuộc tính

Các thuộc tính của phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `cite`
  - : Một URL chỉ định tài liệu nguồn hoặc thông điệp cho thông tin được trích dẫn. Thuộc tính này nhằm chỉ đến thông tin giải thích ngữ cảnh hoặc tài liệu tham khảo cho trích dẫn.

## Ghi chú sử dụng

Theo đặc tả, việc ghi nguồn cho trích dẫn, nếu có, phải được đặt bên ngoài phần tử `<blockquote>`.

Để thay đổi thụt lề áp dụng cho văn bản được trích dẫn, sử dụng các thuộc tính {{Glossary("CSS")}} {{cssxref("margin-left")}} và/hoặc {{cssxref("margin-right")}}, hoặc thuộc tính rút gọn {{cssxref("margin")}}.

Để bao gồm các trích dẫn ngắn hơn dưới dạng nội tuyến thay vì trong một khối riêng biệt, sử dụng phần tử {{HTMLElement("q")}} (Quotation).

## Ví dụ

Ví dụ này minh họa cách sử dụng phần tử `<blockquote>` để trích dẫn một đoạn từ {{RFC(1149)}}, _A Standard for the Transmission of IP Datagrams on Avian Carriers_.

```html
<blockquote cite="https://datatracker.ietf.org/doc/html/rfc1149">
  <p>
    Avian carriers can provide high delay, low throughput, and low altitude
    service. The connection topology is limited to a single point-to-point path
    for each carrier, used with standard carriers, but many carriers can be used
    without significant interference with each other, outside early spring. This
    is because of the 3D ether space available to the carriers, in contrast to
    the 1D ether used by IEEE802.3. The carriers have an intrinsic collision
    avoidance system, which increases availability.
  </p>
</blockquote>
```

### Kết quả

{{EmbedLiveSample("Examples", 640, 180)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >, gốc phân mục, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code>
          <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents"
            >blockquote</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLQuoteElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("q")}} dùng cho trích dẫn nội tuyến.
- Phần tử {{HTMLElement("cite")}} dùng để trích dẫn nguồn.
- [The blockquote element](https://heydonworks.com/article/the-blockquote-element/) qua heydonworks.com (2024)

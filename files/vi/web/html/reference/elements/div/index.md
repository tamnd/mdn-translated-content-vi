---
title: "<div>: Phần tử Phân chia nội dung"
slug: Web/HTML/Reference/Elements/div
page-type: html-element
browser-compat: html.elements.div
sidebar: htmlsidebar
---

Phần tử **`<div>`** trong [HTML](/en-US/docs/Web/HTML) là vùng chứa chung cho nội dung luồng. Nó không có tác dụng đến nội dung hoặc bố cục cho đến khi được tạo kiểu theo một cách nào đó bằng {{glossary("CSS")}} (ví dụ: kiểu được áp dụng trực tiếp cho nó, hoặc một số kiểu bố cục như [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) được áp dụng cho phần tử cha của nó).

{{InteractiveExample("HTML Demo: &lt;div&gt;", "tabbed-standard")}}

```html interactive-example
<div class="warning">
  <img
    src="/shared-assets/images/examples/leopard.jpg"
    alt="An intimidating leopard." />
  <p>Beware of the leopard</p>
</div>
```

```css interactive-example
.warning {
  border: 10px ridge red;
  background-color: yellow;
  padding: 0.5rem;
  display: flex;
  flex-direction: column;
}

.warning img {
  width: 100%;
}

.warning p {
  font: small-caps bold 1.2rem sans-serif;
  text-align: center;
}
```

Là một vùng chứa "thuần túy", phần tử `<div>` không đại diện cho bất cứ điều gì cụ thể. Thay vào đó, nó được sử dụng để nhóm nội dung để có thể dễ dàng tạo kiểu bằng cách sử dụng các thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) hoặc [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id), đánh dấu một phần của tài liệu được viết bằng ngôn ngữ khác (sử dụng thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang)), v.v.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

> [!NOTE]
> Thuộc tính `align` đã lỗi thời; đừng sử dụng nó nữa. Thay vào đó, bạn nên sử dụng các thuộc tính CSS hoặc kỹ thuật như [CSS Grid](/en-US/docs/Web/CSS/Guides/Grid_layout) hoặc [CSS Flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox) để căn chỉnh và định vị các phần tử `<div>` trên trang.

## Ghi chú sử dụng

- Phần tử `<div>` chỉ nên được sử dụng khi không có phần tử ngữ nghĩa nào khác (chẳng hạn như {{HTMLElement("article")}} hoặc {{HTMLElement("nav")}}) phù hợp.

## Khả năng tiếp cận

Phần tử `<div>` có [vai trò ngầm định là `generic`](https://w3c.github.io/aria/#generic), chứ không phải none. Điều này có thể ảnh hưởng đến một số khai báo kết hợp ARIA yêu cầu một phần tử con trực tiếp có vai trò nhất định để hoạt động đúng.

## Ví dụ

### Ví dụ cơ bản

```html
<div>
  <p>
    Any kind of content here. Such as &lt;p&gt;, &lt;table&gt;. You name it!
  </p>
</div>
```

#### Kết quả

{{EmbedLiveSample("A_basic_example", 650, 60)}}

### Ví dụ có tạo kiểu

Ví dụ này tạo một hộp có bóng bằng cách áp dụng kiểu cho `<div>` bằng CSS. Lưu ý cách sử dụng thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) trên `<div>` để áp dụng kiểu có tên `"shadowbox"` cho phần tử.

#### HTML

```html
<div class="shadowbox">
  <p>Here's a very interesting note displayed in a lovely shadowed box.</p>
</div>
```

#### CSS

```css
.shadowbox {
  width: 15em;
  border: 1px solid #333333;
  box-shadow: 8px 8px 5px #444444;
  padding: 8px 12px;
  background-image: linear-gradient(180deg, white, #dddddd 40%, #cccccc);
}
```

#### Kết quả

{{EmbedLiveSample("A_styled_example", 650, 120)}}

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
        >, <a href="/en-US/docs/Web/HTML/Guides/Content_categories#palpable_content">nội dung hữu hình</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.<br />Hoặc (trong HTML {{glossary("WHATWG")}}): Nếu cha là phần tử
        {{HTMLElement("dl")}}: một hoặc nhiều phần tử
        {{HTMLElement("dt")}} theo sau là một hoặc nhiều phần tử
        {{HTMLElement("dd")}}, tùy chọn xen kẽ với các phần tử
        {{HTMLElement("script")}} và
        {{HTMLElement("template")}}.
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
        >.<br />Hoặc (trong HTML {{glossary("WHATWG")}}):
        phần tử {{HTMLElement("dl")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
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
      <td>{{domxref("HTMLDivElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử phân mục ngữ nghĩa: {{HTMLElement("section")}}, {{HTMLElement("article")}}, {{HTMLElement("nav")}}, {{HTMLElement("header")}}, {{HTMLElement("footer")}}
- Phần tử {{HTMLElement("span")}} dùng để tạo kiểu cho nội dung diễn đạt

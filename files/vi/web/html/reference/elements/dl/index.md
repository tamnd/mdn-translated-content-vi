---
title: "<dl>: Phần tử Danh sách mô tả"
slug: Web/HTML/Reference/Elements/dl
page-type: html-element
browser-compat: html.elements.dl
sidebar: htmlsidebar
---

Phần tử **`<dl>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một danh sách mô tả. Phần tử bao gồm một danh sách các nhóm thuật ngữ (được chỉ định bằng phần tử {{HTMLElement("dt")}}) và các mô tả (được cung cấp bởi các phần tử {{HTMLElement("dd")}}). Các cách sử dụng phổ biến cho phần tử này là triển khai bảng thuật ngữ hoặc hiển thị siêu dữ liệu (danh sách các cặp khóa-giá trị).

{{InteractiveExample("HTML Demo: &lt;dl&gt;", "tabbed-standard")}}

```html interactive-example
<p>Cryptids of Cornwall:</p>

<dl>
  <dt>Beast of Bodmin</dt>
  <dd>A large feline inhabiting Bodmin Moor.</dd>

  <dt>Morgawr</dt>
  <dd>A sea serpent.</dd>

  <dt>Owlman</dt>
  <dd>A giant owl-like creature.</dd>
</dl>
```

```css interactive-example
p,
dt {
  font-weight: bold;
}

dl,
dd {
  font-size: 0.9rem;
}

dd {
  margin-bottom: 1em;
}
```

## Thuộc tính

Phần tử này cũng chấp nhận các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `compact` {{Deprecated_inline}}
  - : Thuộc tính Boolean này gợi ý rằng danh sách nên được hiển thị theo kiểu compact. Cách hiểu thuộc tính này phụ thuộc vào trình duyệt. Hãy sử dụng [CSS](/en-US/docs/Web/CSS) thay thế: để tạo hiệu ứng tương tự thuộc tính `compact`, thuộc tính CSS {{cssxref("line-height")}} có thể được sử dụng với giá trị `80%`.

## Khả năng tiếp cận

Mỗi trình đọc màn hình trình bày nội dung `<dl>` theo cách khác nhau, bao gồm tổng số, ngữ cảnh thuật ngữ/định nghĩa và phương thức điều hướng. Những sự khác biệt này không nhất thiết là lỗi.
Kể từ iOS 14, VoiceOver sẽ thông báo rằng nội dung `<dl>` là một danh sách khi điều hướng bằng con trỏ ảo (không phải qua lệnh đọc tất cả). VoiceOver không hỗ trợ các lệnh điều hướng danh sách với `<dl>`. Hãy cẩn thận khi áp dụng vai trò ARIA `term` và `definition` cho các cấu trúc `<dl>` vì VoiceOver (macOS và iOS) sẽ điều chỉnh cách chúng được thông báo.

- [VoiceOver on iOS 14 Supports Description Lists](https://adrianroselli.com/2020/09/voiceover-on-ios-14-supports-description-lists.html)
- [Brief Note on Description List Support](https://adrianroselli.com/2022/12/brief-note-on-description-list-support.html)

## Ví dụ

### Một thuật ngữ và một mô tả

```html
<dl>
  <dt>Firefox</dt>
  <dd>
    A free, open source, cross-platform, graphical web browser developed by the
    Mozilla Corporation and hundreds of volunteers.
  </dd>

  <!-- Other terms and descriptions -->
</dl>
```

#### Kết quả

{{EmbedLiveSample("Single_term_and_description")}}

### Nhiều thuật ngữ, một mô tả

```html
<dl>
  <dt>Firefox</dt>
  <dt>Mozilla Firefox</dt>
  <dt>Fx</dt>
  <dd>
    A free, open source, cross-platform, graphical web browser developed by the
    Mozilla Corporation and hundreds of volunteers.
  </dd>

  <!-- Other terms and descriptions -->
</dl>
```

#### Kết quả

{{EmbedLiveSample("Multiple_terms_single_description")}}

### Một thuật ngữ, nhiều mô tả

```html
<dl>
  <dt>Firefox</dt>
  <dd>
    A free, open source, cross-platform, graphical web browser developed by the
    Mozilla Corporation and hundreds of volunteers.
  </dd>
  <dd>
    The Red Panda also known as the Lesser Panda, Wah, Bear Cat or Firefox, is a
    mostly herbivorous mammal, slightly larger than a domestic cat (60 cm long).
  </dd>

  <!-- Other terms and descriptions -->
</dl>
```

#### Kết quả

{{EmbedLiveSample("Single_term_multiple_descriptions")}}

### Nhiều thuật ngữ và nhiều mô tả

Cũng có thể xác định nhiều thuật ngữ với nhiều mô tả tương ứng, bằng cách kết hợp các ví dụ trên.

### Siêu dữ liệu

Danh sách mô tả hữu ích cho việc hiển thị siêu dữ liệu dưới dạng danh sách các cặp khóa-giá trị.

```html
<dl>
  <dt>Name</dt>
  <dd>Godzilla</dd>
  <dt>Born</dt>
  <dd>1952</dd>
  <dt>Birthplace</dt>
  <dd>Japan</dd>
  <dt>Color</dt>
  <dd>Green</dd>
</dl>
```

#### Kết quả

{{EmbedLiveSample('Metadata')}}

Mẹo: Có thể hữu ích khi xác định dấu phân cách khóa-giá trị trong CSS, chẳng hạn như:

```css
dt::after {
  content: ": ";
}
```

### Bọc các nhóm tên-giá trị trong các phần tử `div`

HTML cho phép bọc mỗi nhóm tên-giá trị trong phần tử `<dl>` bằng một phần tử {{HTMLElement("div")}}. Điều này có thể hữu ích khi sử dụng [microdata](/en-US/docs/Web/HTML/Guides/Microdata), hoặc khi [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) áp dụng cho toàn bộ nhóm, hoặc cho mục đích tạo kiểu.

```html
<dl>
  <div>
    <dt>Name</dt>
    <dd>Godzilla</dd>
  </div>
  <div>
    <dt>Born</dt>
    <dd>1952</dd>
  </div>
  <div>
    <dt>Birthplace</dt>
    <dd>Japan</dd>
  </div>
  <div>
    <dt>Color</dt>
    <dd>Green</dd>
  </div>
</dl>
```

#### Kết quả

{{EmbedLiveSample('Wrapping name-value groups in `div` elements')}}

## Ghi chú

Đừng sử dụng phần tử này (cũng như các phần tử {{HTMLElement("ul")}}) chỉ để tạo thụt lề trên trang. Mặc dù nó hoạt động, đây là thực hành không tốt và che giấu ý nghĩa của danh sách mô tả.

Để thay đổi thụt lề của thuật ngữ mô tả, hãy sử dụng thuộc tính CSS {{cssxref("margin")}} của [CSS](/en-US/docs/Web/CSS).

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
        >, và nếu các con của phần tử <code>&#x3C;dl></code> bao gồm một
        nhóm tên-giá trị, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <p>
          Hoặc: Không hoặc nhiều nhóm, mỗi nhóm bao gồm một hoặc nhiều phần tử
          {{HTMLElement("dt")}} theo sau là một hoặc nhiều phần tử
          {{HTMLElement("dd")}}, tùy chọn xen kẽ với các phần tử
          {{HTMLElement("script")}} và
          {{HTMLElement("template")}}.<br />Hoặc: (trong HTML
          {{Glossary("WHATWG")}}, HTML {{Glossary("W3C")}} 5.2
          và sau này) Một hoặc nhiều phần tử {{HTMLElement("div")}},
          tùy chọn xen kẽ với các phần tử {{HTMLElement("script")}} và
          {{HTMLElement("template")}}.
        </p>
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
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a>,
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role"
            >list</a
          ></code
        >, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLDListElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("dt")}}
- {{HTMLElement("dd")}}

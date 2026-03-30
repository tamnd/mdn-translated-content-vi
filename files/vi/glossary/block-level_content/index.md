---
title: Block-level content
slug: Glossary/Block-level_content
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong CSS, nội dung tham gia vào bố cục khối được gọi là **nội dung cấp khối** (block-level content).

Trong bố cục khối, các hộp được xếp chồng lên nhau theo chiều dọc, bắt đầu từ phía trên của khối chứa. Cạnh ngoài bên trái của mỗi hộp chạm vào cạnh trái của khối chứa. Một phần tử cấp khối luôn bắt đầu trên một dòng mới. Trong các chế độ viết ngang, như tiếng Anh hay tiếng Ả Rập, nó chiếm toàn bộ không gian ngang của phần tử cha (vùng chứa) và không gian dọc bằng chiều cao của nội dung của nó, do đó tạo ra một "khối".

> [!NOTE]
> Hành vi trên của bố cục khối thay đổi nếu {{cssxref("writing-mode")}} của khối chứa được đặt thành giá trị khác với [giá trị mặc định](/en-US/docs/Web/CSS/Reference/Properties/writing-mode#formal_definition).

> [!NOTE]
> Các phần tử HTML (_HyperText Markup Language_) về mặt lịch sử được phân loại là phần tử "cấp khối" hoặc phần tử "nội tuyến". Là một đặc điểm trình bày, điều này hiện được chỉ định bởi CSS.

## Ví dụ

Trong ví dụ này, hai phần tử đoạn văn ({{HTMLElement("p")}}) được đặt trong một {{HTMLElement("div")}}.

```html
<div>
  <p>
    This the first paragraph. The background color of these paragraphs have been
    colored to distinguish them from their parent element.
  </p>
  <p>This is the second paragraph.</p>
</div>
```

Các phần tử đoạn văn ({{HTMLElement("p")}}) mặc định ở cấp khối. Đó là lý do tại sao chúng được hiển thị trong bố cục khối:

```css hidden
p {
  background-color: #8abb55;
}
```

{{EmbedLiveSample("Examples")}}

## Xem thêm

- Các thuật ngữ liên quan:
  - {{glossary("Inline-level content")}}
- [Ngữ cảnh định dạng khối](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context)
- {{cssxref("display")}}
- {{cssxref("writing-mode")}}

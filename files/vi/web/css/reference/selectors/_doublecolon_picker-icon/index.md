---
title: ::picker-icon
slug: Web/CSS/Reference/Selectors/::picker-icon
page-type: css-pseudo-element
browser-compat: css.selectors.picker-icon
sidebar: cssref
---

Phần tử giả **`::picker-icon`** trong [CSS](/en-US/docs/Web/CSS) nhắm vào biểu tượng picker bên trong các điều khiển biểu mẫu có biểu tượng liên quan. Trong trường hợp của một [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), nó chọn biểu tượng mũi tên được hiển thị trên phần tử `<select>` trỏ xuống khi nó đóng.

## Cú pháp

```css-nolint
::picker-icon {
  /* ... */
}
```

## Mô tả

Phần tử giả `::picker-icon` nhắm vào biểu tượng picker của các điều khiển biểu mẫu, tức là biểu tượng được hiển thị trên nút điều khiển. Nó chỉ có thể nhắm vào khi phần tử gốc có picker và có giao diện cơ sở được đặt trên nó thông qua giá trị `base-select` của thuộc tính {{cssxref("appearance")}}. Hộp được tạo ra của nó xuất hiện sau bất kỳ hộp nào được tạo ra bởi phần tử giả {{cssxref("::after")}}, với biểu tượng được chỉ định trong stylesheet mặc định của trình duyệt; bạn có thể tùy chỉnh nó bằng thuộc tính {{cssxref("content")}}.

Bộ chọn `::picker-icon` có thể được dùng để chọn mũi tên hướng xuống ở phía inline-end của [phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select). Điều này hữu ích ví dụ nếu bạn muốn tùy chỉnh màu sắc hoặc kích thước của biểu tượng, sử dụng biểu tượng khác (bằng {{cssxref("content")}} hoặc [SVG](/en-US/docs/Web/SVG)), hoặc tạo hiệu ứng khi picker được mở và đóng.

Chọn biểu tượng picker `<select>` có thể tùy chỉnh là trường hợp sử dụng duy nhất hiện tại cho `::picker-icon`, nhưng có thể có thêm trong tương lai.

> [!NOTE]
> Phần tử giả `::picker-icon` không được đưa vào cây accessibility, vì vậy bất kỳ {{cssxref("content")}} được tạo ra nào được đặt trên nó sẽ không được thông báo bởi các công nghệ hỗ trợ. Bạn vẫn nên đảm bảo rằng bất kỳ biểu tượng mới nào bạn đặt ra có ý nghĩa trực quan cho mục đích dự kiến của nó.

## Ví dụ

### Tạo hiệu ứng cho biểu tượng picker

Để bật chức năng select có thể tùy chỉnh, phần tử `<select>` và picker của nó đều cần có giá trị {{cssxref("appearance")}} là `base-select`:

```css
select,
::picker(select) {
  appearance: base-select;
}
```

Bạn có thể, ví dụ, nhắm vào `::picker-icon` và đặt cho nó {{cssxref("color")}} tùy chỉnh và {{cssxref("transition")}} để các thay đổi đối với thuộc tính {{cssxref("rotate")}} của nó được tạo hiệu ứng mượt mà:

```css
select::picker-icon {
  color: #999999;
  transition: 0.4s rotate;
}
```

Trong quy tắc tiếp theo, `::picker-icon` được kết hợp với lớp giả {{cssxref(":open")}} — nhắm vào biểu tượng chỉ khi picker đang mở — chuyển đổi nó sang giá trị `rotate` là `180deg` khi `<select>` được mở.

```css
select:open::picker-icon {
  rotate: 180deg;
}
```

Xem [Tạo kiểu cho biểu tượng picker](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select#styling_the_picker_icon) để biết ví dụ đầy đủ sử dụng mã này, cùng với ví dụ trực tiếp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{htmlelement("select")}}, {{htmlelement("option")}}, {{htmlelement("optgroup")}}, {{htmlelement("label")}}, {{htmlelement("button")}}, {{htmlelement("selectedcontent")}}
- {{cssxref("appearance")}}
- {{cssxref("::picker()", "::picker(select)")}}, {{cssxref("::checkmark")}}
- {{cssxref(":open")}}, {{cssxref(":checked")}}
- [Phần tử select có thể tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)

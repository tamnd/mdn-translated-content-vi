---
title: Cookbook template
slug: Web/CSS/How_to/Layout_cookbook/Contribute_a_recipe/Cookbook_template
page-type: guide
sidebar: cssref
---

> [!NOTE]
> Đây là trang template cho một trang CSS Cookbook. Vui lòng sử dụng trang này làm template thô khi bạn tạo một trang cookbook mới.
> _Chú thích in nghiêng là thông tin về cách sử dụng một phần của template._

_Mô tả vấn đề mà công thức này giải quyết hoặc mẫu bạn đang minh họa._

## Yêu cầu

_Mẫu này cần bao gồm những gì, hoặc nó cần giải quyết những vấn đề gì? Liệt kê ở đây._

## Công thức

_Thay đổi code ví dụ. Tham số cuối cùng là chiều cao ví dụ trực tiếp, bạn có thể thay đổi nếu cần. Đề cập rằng bạn có thể nhấp vào "Play" trong các khối code để chỉnh sửa ví dụ trong MDN Playground._

```html live-sample___center-example
<div class="container">
  <div class="item">I am centered!</div>
</div>
```

```css live-sample___center-example
.container {
  border: 2px solid rgb(75 70 74);
  border-radius: 0.5em;

  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.item {
  border: 2px solid rgb(95 97 110);
  border-radius: 0.5em;
  padding: 20px;

  width: 10em;
}
```

{{EmbedLiveSample("center-example", "", "250px")}}

## Các lựa chọn được thực hiện

_Giải thích các quyết định của bạn khi tạo mẫu. Tại sao bạn chọn một phương pháp nhất định? Nếu bạn muốn thêm một ví dụ bổ sung ở đây — ví dụ như một phiên bản có phương án dự phòng, hãy làm vậy. Phần này được cố ý để thoải mái vì các mẫu có thể từ rất đơn giản đến phức tạp hơn._

## Các phương án dự phòng hoặc phương pháp thay thế hữu ích

_Nếu có các phương pháp thay thế hữu ích để xây dựng công thức, hoặc các công thức dự phòng để sử dụng nếu bạn phải hỗ trợ các trình duyệt không hỗ trợ, hãy bao gồm chúng trong các phần riêng biệt ở đây._

## Vấn đề về khả năng tiếp cận

_Bao gồm phần này nếu có bất kỳ điều cụ thể nào cần chú ý liên quan đến khả năng tiếp cận. Nếu không liên quan đến mẫu của bạn, phần này có thể được bỏ qua._

## Xem thêm

- _Liên kết đến các thuộc tính liên quan: `example-property`_
- _Liên kết đến bài viết hướng dẫn cách sử dụng thuộc tính trong ngữ cảnh: "Using … article"_
- _Liên kết bên ngoài rất tốt. Đừng ngại liên kết bên ngoài, nhưng chúng phải xuất sắc và không chỉ đề cập đến các chi tiết nhỏ._

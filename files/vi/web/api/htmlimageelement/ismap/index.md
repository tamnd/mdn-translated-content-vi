---
title: "HTMLImageElement: isMap property"
short-title: isMap
slug: Web/API/HTMLImageElement/isMap
page-type: web-api-instance-property
browser-compat: api.HTMLImageElement.isMap
---

{{APIRef("HTML DOM")}}

Thuộc tính **`isMap`** của giao diện {{domxref("HTMLImageElement")}} cho biết hình ảnh là một phần của [bản đồ phía máy chủ](https://en.wikipedia.org/wiki/Image_map#Server-side). Nếu vậy, tọa độ nơi người dùng nhấp vào hình ảnh sẽ được gửi đến máy chủ. Nó phản ánh thuộc tính nội dung [`ismap`](/en-US/docs/Web/HTML/Reference/Elements/img#ismap) của phần tử `<img>`. Thuộc tính này chỉ được phép nếu phần tử `<img>` là hậu duệ của phần tử {{htmlelement("a")}} có thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) hợp lệ.

> [!NOTE]
> Vì lý do khả năng truy cập, bạn thường nên tránh sử dụng bản đồ hình ảnh phía máy chủ vì chúng yêu cầu sử dụng chuột. Thay vào đó, hãy sử dụng [bản đồ hình ảnh phía máy khách](/en-US/docs/Web/HTML/How_to/Add_a_hit_map_on_top_of_an_image).

## Giá trị

Giá trị Boolean là `true` nếu hình ảnh đang được sử dụng cho bản đồ hình ảnh phía máy chủ; nếu không thì giá trị là `false`.

## ghi chú sử dụng

Khi nhấp vào một hình ảnh được đánh dấu là một phần của bản đồ hình ảnh phía máy chủ, trình duyệt sẽ tạo chuỗi "?x,y", trong đó x và y cho biết tọa độ mà tại đó chuột được nhấp vào dưới dạng khoảng cách từ góc trên cùng bên trái của hình ảnh, được chỉ định bằng pixel CSS.

Sau đó, trình duyệt tìm nạp URL đó từ máy chủ và hiển thị hoặc tải xuống tùy thuộc vào giá trị của thuộc tính [`download`](/en-US/docs/Web/HTML/Reference/Elements/a#download).

Không giống như bản đồ hình ảnh phía máy chủ, bản đồ hình ảnh phía máy khách không khiến phần tử {{HTMLElement("img")}} chấp nhận chế độ nội dung tương tác.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

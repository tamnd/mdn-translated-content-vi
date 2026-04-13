---
title: Sử dụng interest invoker
slug: Web/API/Popover_API/Using_interest_invokers
page-type: guide
---

{{DefaultAPISidebar("Popover API")}}

**Interest invoker** cung cấp một cơ chế để cập nhật giao diện hoặc chạy mã tùy chỉnh khi người dùng "thể hiện quan tâm" hoặc "mất quan tâm" với một phần tử (ví dụ: bằng cách di chuột hoặc không di chuột vào nó). Chúng được sử dụng phổ biến nhất để hiển thị và ẩn popover. Hướng dẫn này giải thích các khái niệm đằng sau interest invoker, các trường hợp sử dụng của chúng và cách sử dụng chúng.

## Khái niệm

Popover API cung cấp chức năng hiển thị một popover khi một phần tử điều khiển liên quan (the **invoker**) được kích hoạt, ví dụ, khi nó được nhấp. Tính năng này hữu ích để hiển thị các phần tử giao diện như modal và bảng thông tin. Bạn có thể [tạo popover theo cách khai báo](/en-US/docs/Web/API/Popover_API/Using#creating_declarative_popovers) bằng cách sử dụng thuộc tính [`popover`](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) cùng với [`popovertarget`](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget) hoặc [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor).

Ngoài các popover dựa trên kích hoạt này, còn có nhu cầu phổ biến để hiển thị một popover khi một phần tử điều khiển được di chuột hoặc được tiêu điểm. Interest invoker cho phép trình duyệt cung cấp hành vi popover dựa trên quan tâm theo cách nhất quán và có thể truy cập, mà không yêu cầu JavaScript.

> [!NOTE]
> Trên các thiết bị có phím <kbd>Esc</kbd>, nhấn nó sẽ hủy tất cả quan tâm. Điều này cung cấp cơ chế thoát chung nếu tương tác trở nên gây xao lãng hoặc không mong muốn.

## Tạo interest invoker

Tạo interest invoker theo cách khai báo có hai yêu cầu sau:

- Một **phần tử invoker**: Đây là phần tử mà người dùng tương tác để chỉ ra quan tâm và kích hoạt một hành động. Phần tử invoker phải có thuộc tính [`interestfor`](/en-US/docs/Web/HTML/Reference/Elements/a#interestfor) có giá trị là `id` của phần tử mục tiêu.

- Một **phần tử mục tiêu**: Đây là phần tử bị ảnh hưởng hoặc được kiểm soát khi quan tâm được đạt hoặc mất. Phần tử mục tiêu phải có `id`.

## Kết hợp interest invoker với popover dựa trên kích hoạt

Bạn có thể kết hợp interest invoker với các popover thông thường trên cùng một phần tử điều khiển. Trong ví dụ sau, một phần tử {{htmlelement("button")}} được thiết lập như một interest invoker bằng thuộc tính `interestfor`, nghĩa là nó sẽ hiển thị một tooltip khi người dùng thể hiện quan tâm với nó. Nếu nút được nhấp, nó sẽ hiển thị hoặc ẩn một popover khác được tham chiếu bởi thuộc tính `commandfor`.

## Tạo kiểu interest invoker

Khi tạo kiểu cho các popover được sử dụng với interest invoker, bạn có thể sử dụng các kỹ thuật tạo kiểu giống như với bất kỳ popover nào khác.

- Thuộc tính viết tắt {{cssxref("interest-delay")}} và các thuộc tính dài hơn liên quan: Có thể được sử dụng để thêm độ trễ giữa việc người dùng đạt hoặc mất quan tâm và trình duyệt hành động dựa trên thay đổi đó.
- Các pseudo-class {{cssxref(":interest-source")}} và {{cssxref(":interest-target")}}: Có thể được sử dụng để áp dụng kiểu cho interest invoker và phần tử mục tiêu liên kết của nó.

## JavaScript API cho interest invoker

Interest invoker có một JavaScript API liên kết cho phép bạn truy vấn phần tử đang được nhắm mục tiêu bởi một interest invoker và chạy mã tùy chỉnh khi quan tâm được hiển thị hoặc mất:

- Thuộc tính {{domxref("HTMLButtonElement.interestForElement", "interestForElement")}}: Trả về một tham chiếu đến phần tử mục tiêu cho interest invoker.
- Các sự kiện {{domxref("HTMLElement.interest_event", "interest")}} và {{domxref("HTMLElement.loseinterest_event", "loseinterest")}}: Được kích hoạt trên phần tử mục tiêu của interest invoker khi quan tâm được hiển thị và mất.
- Giao diện {{domxref("InterestEvent")}}: Đối tượng sự kiện cho các sự kiện `interest` và `loseinterest`.

## Xem thêm

- [Trang đích ví dụ interest invoker](https://mdn.github.io/dom-examples/interest-invokers/)
- [Popover API](/en-US/docs/Web/API/Popover_API)

---
title: Biểu mẫu web
slug: Learn_web_development/Extensions/Forms
page-type: learn-module
sidebar: learnsidebar
---

{{NextMenu("Learn_web_development/Extensions/Forms/Your_first_form", "Learn_web_development/Extensions")}}

Mô-đun này cung cấp một loạt các bài viết giúp bạn nắm vững những kiến thức cần thiết về biểu mẫu web. Biểu mẫu web là một công cụ rất mạnh mẽ để tương tác với người dùng — thường được sử dụng nhất để thu thập dữ liệu từ người dùng, hoặc cho phép họ điều khiển giao diện người dùng. Tuy nhiên, vì lý do lịch sử và kỹ thuật, không phải lúc nào cũng rõ ràng cách sử dụng chúng một cách đầy đủ tiềm năng. Trong các bài viết được liệt kê bên dưới, chúng ta sẽ tìm hiểu tất cả các khía cạnh cần thiết của biểu mẫu web, bao gồm đánh dấu cấu trúc HTML, tạo kiểu cho các điều khiển biểu mẫu, kiểm tra hợp lệ dữ liệu biểu mẫu và gửi dữ liệu lên máy chủ.

## Điều kiện tiên quyết

Trước khi bắt đầu mô-đun này, bạn nên hoàn thành ít nhất phần [Giới thiệu HTML](/en-US/docs/Learn_web_development/Core/Structuring_content) của chúng tôi. Lúc đó bạn sẽ thấy các [Hướng dẫn nhập môn](#introductory_tutorials) dễ hiểu, và cũng có thể sử dụng hướng dẫn về [Điều khiển biểu mẫu gốc cơ bản](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls).

Tuy nhiên, để thành thạo biểu mẫu đòi hỏi nhiều hơn chỉ kiến thức HTML — bạn cũng cần học một số kỹ thuật cụ thể để tạo kiểu cho các điều khiển biểu mẫu, và cần một số kiến thức lập trình để xử lý những thứ như kiểm tra hợp lệ và tạo điều khiển biểu mẫu tùy chỉnh. Vì vậy, trước khi xem các phần khác được liệt kê bên dưới, chúng tôi khuyến nghị bạn nên học về [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) trước.

Đoạn văn trên là chỉ dẫn tốt về lý do tại sao chúng tôi đặt biểu mẫu web vào mô-đun độc lập, thay vì cố gắng kết hợp từng phần vào các chủ đề HTML, CSS và JavaScript — các phần tử biểu mẫu phức tạp hơn hầu hết các phần tử HTML khác, và chúng cũng đòi hỏi sự kết hợp chặt chẽ giữa các kỹ thuật CSS và JavaScript liên quan để tận dụng tối đa.

> [!NOTE]
> Nếu bạn đang làm việc trên máy tính, máy tính bảng hoặc thiết bị khác mà bạn không thể tạo tệp, bạn có thể thử chạy mã trong trình soạn thảo trực tuyến như [CodePen](https://codepen.io/) hoặc [JSFiddle](https://jsfiddle.net/).

## Hướng dẫn nhập môn

- [Biểu mẫu đầu tiên của bạn](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form)
  - : Bài viết đầu tiên trong loạt bài của chúng tôi cung cấp cho bạn trải nghiệm đầu tiên về việc tạo biểu mẫu web, bao gồm thiết kế biểu mẫu đơn giản, triển khai nó bằng các phần tử HTML phù hợp, thêm một số kiểu dáng rất đơn giản thông qua CSS, và cách dữ liệu được gửi lên máy chủ.
- [Cách cấu trúc biểu mẫu web](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form)
  - : Sau khi nắm vững những kiến thức cơ bản, chúng ta sẽ xem xét chi tiết hơn các phần tử được dùng để cung cấp cấu trúc và ý nghĩa cho các phần khác nhau của biểu mẫu.

## Các loại điều khiển biểu mẫu khác nhau

- [Điều khiển biểu mẫu gốc cơ bản](/en-US/docs/Learn_web_development/Extensions/Forms/Basic_native_form_controls)
  - : Chúng ta bắt đầu phần này bằng cách xem xét chi tiết chức năng của các loại {{htmlelement("input")}} HTML gốc ban đầu, xem xét những tùy chọn nào có sẵn để thu thập các loại dữ liệu khác nhau.
- [Các loại đầu vào HTML5](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types)
  - : Tại đây chúng ta tiếp tục tìm hiểu sâu về phần tử `<input>`, xem xét các loại trường nhập liệu bổ sung được cung cấp khi HTML5 ra đời, và các điều khiển giao diện người dùng cùng các cải tiến thu thập dữ liệu mà chúng cung cấp. Ngoài ra, chúng ta xem xét phần tử {{htmlelement('output')}}.
- [Các điều khiển biểu mẫu khác](/en-US/docs/Learn_web_development/Extensions/Forms/Other_form_controls)
  - : Tiếp theo chúng ta xem xét tất cả các điều khiển biểu mẫu không phải `<input>` và các công cụ liên quan, như {{htmlelement('select')}}, {{htmlelement('textarea')}}, {{htmlelement('meter')}} và {{htmlelement('progress')}}.

## Hướng dẫn tạo kiểu biểu mẫu

- [Tạo kiểu biểu mẫu web](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms)
  - : Bài viết này cung cấp giới thiệu về việc tạo kiểu biểu mẫu bằng CSS, bao gồm tất cả những kiến thức cơ bản bạn có thể cần để thực hiện các tác vụ tạo kiểu cơ bản.
- [Tạo kiểu biểu mẫu nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling)
  - : Tại đây chúng ta xem xét một số kỹ thuật tạo kiểu biểu mẫu nâng cao hơn cần được sử dụng khi cố gắng xử lý một số phần tử biểu mẫu khó tạo kiểu hơn.
- [Phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select)
  - : Bài viết này giải thích cách sử dụng các tính năng HTML và CSS hiện đại chuyên dụng kết hợp với nhau để tạo các phần tử `<select>` tùy chỉnh hoàn toàn. Điều này bao gồm kiểm soát hoàn toàn việc tạo kiểu cho nút select, bộ chọn thả xuống, biểu tượng mũi tên, dấu kiểm lựa chọn hiện tại và từng phần tử `<option>` riêng lẻ.
- [Hộp danh sách select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select_listboxes)
  - : Bài viết này tiếp nối bài trước, xem xét cách tạo kiểu các phần tử `<select>` hộp danh sách tùy chỉnh.
- [Lớp giả giao diện người dùng](/en-US/docs/Learn_web_development/Extensions/Forms/UI_pseudo-classes)
  - : Giới thiệu về các lớp giả giao diện người dùng cho phép nhắm mục tiêu các điều khiển biểu mẫu HTML dựa trên trạng thái hiện tại của chúng.

## Kiểm tra hợp lệ và gửi dữ liệu biểu mẫu

- [Kiểm tra hợp lệ biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
  - : Gửi dữ liệu thôi chưa đủ — chúng ta cũng cần đảm bảo rằng dữ liệu người dùng nhập vào biểu mẫu đúng định dạng để xử lý thành công, và nó sẽ không phá vỡ ứng dụng của chúng ta. Chúng ta cũng muốn giúp người dùng điền đúng biểu mẫu và không bị thất vọng khi sử dụng ứng dụng. Kiểm tra hợp lệ biểu mẫu giúp chúng ta đạt được những mục tiêu này — bài viết này cho bạn biết những gì bạn cần biết.
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)
  - : Bài viết này xem xét những gì xảy ra khi người dùng gửi biểu mẫu — dữ liệu đi đâu, và chúng ta xử lý nó như thế nào khi nhận được? Chúng ta cũng xem xét một số vấn đề bảo mật liên quan đến việc gửi dữ liệu biểu mẫu.

## Hướng dẫn bổ sung

Các bài viết sau không được đưa vào lộ trình học tập, nhưng sẽ hữu ích và thú vị khi bạn đã nắm vững các kỹ thuật trên và muốn tìm hiểu thêm.

- [Cách xây dựng điều khiển biểu mẫu tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls)
  - : Bạn sẽ gặp một số trường hợp khi các widget biểu mẫu gốc không cung cấp những gì bạn cần, ví dụ vì lý do tạo kiểu hoặc chức năng. Trong những trường hợp đó, bạn có thể cần tự xây dựng widget biểu mẫu từ HTML thô. Bài viết này giải thích cách bạn sẽ làm điều này và những cân nhắc bạn cần lưu ý khi làm vậy, cùng với một nghiên cứu thực tế.
- [Gửi biểu mẫu thông qua JavaScript](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_forms_through_JavaScript)
  - : Bài viết này xem xét các cách sử dụng biểu mẫu để tập hợp một yêu cầu HTTP và gửi nó thông qua JavaScript tùy chỉnh, thay vì gửi biểu mẫu thông thường. Nó cũng xem xét lý do tại sao bạn muốn làm điều này và hậu quả của việc làm vậy. (Xem thêm [Sử dụng đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects).)
- [Biểu mẫu HTML trong các trình duyệt cũ](/en-US/docs/Learn_web_development/Extensions/Forms/HTML_forms_in_legacy_browsers)
  - : Bài viết này cung cấp các mẹo và thủ thuật để giúp giảm bớt khó khăn nếu và khi bạn cần hỗ trợ các trình duyệt cũ với biểu mẫu HTML.
- [Phương thức nhập liệu và điều khiển của người dùng](/en-US/docs/Learn_web_development/Extensions/Forms/User_input_methods)
  - : Bài viết này trình bày các cách khác nhau mà người dùng tương tác với biểu mẫu và nội dung web khác, đồng thời cung cấp các khuyến nghị về quản lý đầu vào của người dùng, ví dụ thực tế và liên kết đến thông tin thêm.

## Xem thêm

- [Tài liệu tham khảo phần tử biểu mẫu HTML](/en-US/docs/Web/HTML/Reference/Elements#forms)
- [Tài liệu tham khảo các loại `<input>` HTML](/en-US/docs/Web/HTML/Reference/Elements/input)
- [Tài liệu tham khảo thuộc tính HTML](/en-US/docs/Web/HTML/Reference/Attributes)

{{NextMenu("Learn_web_development/Extensions/Forms/Your_first_form", "Learn_web_development/Extensions")}}

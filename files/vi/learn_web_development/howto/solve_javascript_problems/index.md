---
title: Solve common JavaScript problems
short-title: Common JavaScript problems
slug: Learn_web_development/Howto/Solve_JavaScript_problems
page-type: landing-page
sidebar: learn-how-to
---

Các liên kết dưới đây trỏ đến giải pháp cho những vấn đề phổ biến mà bạn có thể gặp phải khi viết JavaScript.

## Những lỗi thường gặp của người mới bắt đầu

### Chính tả và kiểu chữ đúng

Nếu mã của bạn không hoạt động và/hoặc trình duyệt báo rằng có gì đó không xác định, hãy kiểm tra xem bạn đã viết đúng chính tả tất cả tên biến, tên hàm, v.v. chưa.

Một số hàm tích hợp phổ biến của trình duyệt thường gây ra lỗi là:

| Đúng                       | Sai                       |
| -------------------------- | ------------------------- |
| `getElementsByTagName()`   | `getElementByTagName()`   |
| `getElementsByName()`      | `getElementByName()`      |
| `getElementsByClassName()` | `getElementByClassName()` |
| `getElementById()`         | `getElementsById()`       |

### Vị trí dấu chấm phẩy

Bạn cần đảm bảo rằng bạn không đặt dấu chấm phẩy ở vị trí không chính xác. Ví dụ:

| Đúng                        | Sai                         |
| --------------------------- | --------------------------- |
| `elem.style.color = 'red';` | `elem.style.color = 'red;'` |

### Hàm

Có một số điều có thể xảy ra lỗi với hàm.

Một trong những lỗi phổ biến nhất là khai báo hàm nhưng không gọi nó ở bất kỳ đâu. Ví dụ:

```js
function myFunction() {
  alert("This is my function.");
}
```

Đoạn mã này sẽ không làm gì trừ khi bạn gọi nó bằng câu lệnh sau:

```js
myFunction();
```

#### Phạm vi hàm

Hãy nhớ rằng [hàm có phạm vi riêng của chúng](/en-US/docs/Learn_web_development/Core/Scripting/Functions#function_scope_and_conflicts) — bạn không thể truy cập một giá trị biến được đặt bên trong một hàm từ bên ngoài hàm, trừ khi bạn khai báo biến đó ở phạm vi toàn cục (tức là không nằm trong bất kỳ hàm nào), hoặc [trả về giá trị](/en-US/docs/Learn_web_development/Core/Scripting/Return_values) từ hàm.

#### Chạy mã sau câu lệnh return

Hãy nhớ rằng khi bạn trả về từ một hàm, trình thông dịch JavaScript thoát khỏi hàm đó — không có mã nào sau câu lệnh return sẽ được thực thi.

Trên thực tế, một số trình duyệt (như Firefox) sẽ cho bạn thông báo lỗi trong bảng điều khiển nhà phát triển nếu bạn có mã sau câu lệnh return. Firefox hiển thị "unreachable code after return statement".

### Ký hiệu đối tượng so với gán thông thường

Khi bạn gán thứ gì đó theo cách thông thường trong JavaScript, bạn sử dụng một dấu bằng, ví dụ:

```js
const myNumber = 0;
```

Tuy nhiên, với [Đối tượng](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects), bạn cần chú ý sử dụng cú pháp đúng. Đối tượng phải được bao quanh bởi dấu ngoặc nhọn, tên thành viên phải được phân tách khỏi giá trị của chúng bằng dấu hai chấm, và các thành viên phải được phân tách bằng dấu phẩy. Ví dụ:

```js
const myObject = {
  name: "Chris",
  age: 38,
};
```

## Định nghĩa cơ bản

- [JavaScript là gì?](/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript#a_high-level_definition)
- [Biến là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#what_is_a_variable)
- [Chuỗi là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Strings)
- [Mảng là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#what_is_an_array)
- [Vòng lặp là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Loops)
- [Hàm là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Functions)
- [Sự kiện là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Events)
- [Đối tượng là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#object_basics)
- [JSON là gì?](/en-US/docs/Learn_web_development/Core/Scripting/JSON#no_really_what_is_json)
- [Web API là gì?](/en-US/docs/Learn_web_development/Extensions/Client-side_APIs/Introduction#what_are_apis)
- [DOM là gì?](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting#the_document_object_model)

## Các trường hợp sử dụng cơ bản

### Tổng quát

- [Làm thế nào để thêm JavaScript vào trang của bạn?](/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript#how_do_you_add_javascript_to_your_page)
- [Làm thế nào để thêm chú thích vào mã JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/What_is_JavaScript#comments)

### Biến

- [Làm thế nào để khai báo một biến?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#declaring_a_variable)
- [Làm thế nào để khởi tạo một biến với một giá trị?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#initializing_a_variable)
- [Làm thế nào để cập nhật giá trị của một biến?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#updating_a_variable) (xem thêm [Toán tử gán](/en-US/docs/Learn_web_development/Core/Scripting/Math#assignment_operators))
- [Các giá trị trong JavaScript có thể có những kiểu dữ liệu gì?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#variable_types)
- ['Kiểu động' nghĩa là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Variables#dynamic_typing)

### Toán học

- [Những kiểu số nào bạn phải xử lý trong lập trình web?](/en-US/docs/Learn_web_development/Core/Scripting/Math#types_of_numbers)
- [Làm thế nào để thực hiện toán học cơ bản trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Math#arithmetic_operators)
- [Độ ưu tiên toán tử là gì, và nó được xử lý như thế nào trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Math#operator_precedence)
- [Làm thế nào để tăng và giảm giá trị trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Math#increment_and_decrement_operators)
- [Làm thế nào để so sánh các giá trị trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Math#comparison_operators) (ví dụ: để xem cái nào lớn hơn, hoặc để kiểm tra xem một giá trị có bằng giá trị khác không).

### Chuỗi

- [Làm thế nào để tạo một chuỗi trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Strings#declaring_strings)
- [Bạn có phải sử dụng dấu ngoặc đơn hay dấu ngoặc kép không?](/en-US/docs/Learn_web_development/Core/Scripting/Strings#single_quotes_double_quotes_and_backticks)
- [Làm thế nào để ghép các chuỗi lại với nhau?](/en-US/docs/Learn_web_development/Core/Scripting/Strings#concatenation_in_context)
- [Bạn có thể ghép chuỗi và số lại với nhau không?](/en-US/docs/Learn_web_development/Core/Scripting/Strings#numbers_vs._strings)
- [Làm thế nào để tìm độ dài của một chuỗi?](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#finding_the_length_of_a_string)
- [Làm thế nào để tìm ký tự nằm ở một vị trí nhất định trong chuỗi?](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#retrieving_a_specific_string_character)
- [Làm thế nào để tìm và trích xuất một chuỗi con cụ thể từ một chuỗi?](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#extracting_a_substring_from_a_string)
- [Làm thế nào để thay đổi kiểu chữ của một chuỗi?](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#changing_case)
- [Làm thế nào để thay thế một chuỗi con cụ thể bằng một chuỗi khác?](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods#updating_parts_of_a_string)

### Mảng

- [Làm thế nào để tạo một mảng?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#creating_arrays)
- [Làm thế nào để truy cập và sửa đổi các phần tử trong mảng?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#accessing_and_modifying_array_items) (bao gồm cả mảng đa chiều)
- [Làm thế nào để tìm độ dài của mảng?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#finding_the_length_of_an_array)
- [Làm thế nào để thêm phần tử vào mảng?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#adding_items)
- [Làm thế nào để xóa phần tử khỏi mảng?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#removing_items)
- [Làm thế nào để tách một chuỗi thành các phần tử mảng, hoặc ghép các phần tử mảng thành một chuỗi?](/en-US/docs/Learn_web_development/Core/Scripting/Arrays#converting_between_strings_and_arrays)

### Gỡ lỗi JavaScript

- [Các loại lỗi cơ bản là gì?](/en-US/docs/Learn_web_development/Core/Scripting/What_went_wrong#types_of_error)
- [Công cụ dành cho nhà phát triển của trình duyệt là gì, và làm thế nào để truy cập chúng?](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/What_are_browser_developer_tools)
- [Làm thế nào để ghi một giá trị vào bảng điều khiển JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Debugging_JavaScript#the_console_api)
- [Làm thế nào để sử dụng điểm dừng và các tính năng gỡ lỗi JavaScript khác?](/en-US/docs/Learn_web_development/Core/Scripting/Debugging_JavaScript#using_the_javascript_debugger)

Để biết thêm thông tin về gỡ lỗi JavaScript, hãy xem [Gỡ lỗi và xử lý lỗi JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Debugging_JavaScript). Xem thêm [Các lỗi thường gặp khác](/en-US/docs/Learn_web_development/Core/Scripting/What_went_wrong#other_common_errors) để biết mô tả về các lỗi thường gặp.

### Ra quyết định trong mã

- [Làm thế nào để thực thi các khối mã khác nhau, tùy thuộc vào giá trị của biến hoặc điều kiện khác?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals)
- [Làm thế nào để sử dụng câu lệnh if...else?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#if...else_statements)
- [Làm thế nào để lồng một khối quyết định bên trong khối quyết định khác?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#nesting_if...else)
- [Làm thế nào để sử dụng các toán tử AND, OR và NOT trong JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#logical_operators_and_or_and_not)
- [Làm thế nào để xử lý thuận tiện một số lượng lớn lựa chọn cho một điều kiện?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#switch_statements)
- [Làm thế nào để sử dụng toán tử ba ngôi để lựa chọn nhanh giữa hai tùy chọn dựa trên kiểm tra đúng hay sai?](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#ternary_operator)

### Vòng lặp/Lặp đi lặp lại

- [Làm thế nào để chạy cùng một đoạn mã nhiều lần?](/en-US/docs/Learn_web_development/Core/Scripting/Loops)
- [Làm thế nào để thoát khỏi vòng lặp trước khi kết thúc nếu một điều kiện nhất định được đáp ứng?](/en-US/docs/Learn_web_development/Core/Scripting/Loops#exiting_loops_with_break)
- [Làm thế nào để bỏ qua vòng lặp tiếp theo nếu một điều kiện nhất định được đáp ứng?](/en-US/docs/Learn_web_development/Core/Scripting/Loops#skipping_iterations_with_continue)
- [Làm thế nào để sử dụng vòng lặp while và do...while?](/en-US/docs/Learn_web_development/Core/Scripting/Loops#while_and_do...while)

## Các trường hợp sử dụng trung cấp

### Hàm

- [Làm thế nào để tìm các hàm trong trình duyệt?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#built-in_browser_functions)
- [Sự khác biệt giữa hàm và phương thức là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#functions_versus_methods)
- [Làm thế nào để tạo hàm của riêng bạn?](/en-US/docs/Learn_web_development/Core/Scripting/Build_your_own_function)
- [Làm thế nào để chạy (gọi, hay kích hoạt) một hàm?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#invoking_functions)
- [Hàm ẩn danh là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#anonymous_functions_and_arrow_functions)
- [Làm thế nào để chỉ định tham số (hoặc đối số) khi gọi hàm?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#function_parameters)
- [Phạm vi hàm là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Functions#function_scope_and_conflicts)
- [Giá trị trả về là gì, và làm thế nào để sử dụng chúng?](/en-US/docs/Learn_web_development/Core/Scripting/Return_values)

### Đối tượng

- [Làm thế nào để tạo một đối tượng?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#object_basics)
- [Ký hiệu dấu chấm là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#dot_notation)
- [Ký hiệu dấu ngoặc vuông là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#bracket_notation)
- [Làm thế nào để lấy và thiết lập các phương thức và thuộc tính của một đối tượng?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#setting_object_members)
- [`this` trong ngữ cảnh của một đối tượng là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics#what_is_this)
- [Lập trình hướng đối tượng là gì?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming)
- [Hàm tạo và thể hiện là gì, và làm thế nào để tạo chúng?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming#classes_and_instances)

### JSON

- [Làm thế nào để cấu trúc dữ liệu JSON và đọc nó từ JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/JSON#json_structure)
- [Làm thế nào để chuyển đổi một đối tượng JSON thành chuỗi văn bản và ngược lại?](/en-US/docs/Learn_web_development/Core/Scripting/JSON#converting_between_objects_and_text)

### Sự kiện

- [Trình xử lý sự kiện là gì và làm thế nào để sử dụng chúng?](/en-US/docs/Learn_web_development/Core/Scripting/Events#event_handler_properties)
- [Trình xử lý sự kiện nội tuyến là gì?](/en-US/docs/Learn_web_development/Core/Scripting/Events#inline_event_handlers_—_dont_use_these)
- [Hàm `addEventListener()` làm gì, và làm thế nào để sử dụng nó?](/en-US/docs/Learn_web_development/Core/Scripting/Events#using_addeventlistener)
- [Đối tượng sự kiện là gì, và làm thế nào để sử dụng chúng?](/en-US/docs/Learn_web_development/Core/Scripting/Events#event_objects)
- [Làm thế nào để ngăn chặn hành vi sự kiện mặc định?](/en-US/docs/Learn_web_development/Core/Scripting/Events#preventing_default_behavior)
- [Các sự kiện được kích hoạt như thế nào trên các phần tử lồng nhau? (lan truyền sự kiện, liên quan — bong bóng và thu bắt sự kiện)](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling)
- [Ủy thác sự kiện là gì, và nó hoạt động như thế nào?](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling#event_delegation)

### JavaScript hướng đối tượng

- [Nguyên mẫu đối tượng là gì?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes)
- [Làm thế nào để thêm phương thức vào hàm tạo?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_prototypes#setting_a_prototype)
- [Làm thế nào để tạo một hàm tạo mới kế thừa các thành viên từ hàm tạo cha?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Classes_in_JavaScript)
- [Khi nào nên sử dụng kế thừa trong JavaScript?](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object-oriented_programming#inheritance)

### Web API

- [Làm thế nào để thao tác DOM (ví dụ: thêm hoặc xóa phần tử) bằng JavaScript?](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting#doing_some_basic_dom_manipulation)

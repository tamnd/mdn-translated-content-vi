---
title: Tài nguyên Ember và khắc phục sự cố
slug: Learn_web_development/Core/Frameworks_libraries/Ember_resources
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Ember_routing", "Learn_web_development/Core/Frameworks_libraries")}}

Bài viết Ember cuối cùng của chúng ta cung cấp cho bạn danh sách các tài nguyên bạn có thể sử dụng để tiếp tục học, cộng với một số thông tin khắc phục sự cố hữu ích và các thông tin khác.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <p>
          Tối thiểu, nên quen thuộc với các ngôn ngữ cốt lõi
          <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>,
          <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và
          <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, và
          có kiến thức về
          <a
            href="/en-US/docs/Learn_web_development/Getting_started/Environment_setup/Command_line"
            >terminal/command line</a
          >.
        </p>
        <p>
          Hiểu sâu hơn về các tính năng JavaScript hiện đại (chẳng hạn như class,
          mô-đun, v.v.), sẽ rất có lợi, vì Ember sử dụng nhiều chúng.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Cung cấp các liên kết tài nguyên thêm và thông tin khắc phục sự cố.
      </td>
    </tr>
  </tbody>
</table>

## Tài nguyên thêm

- [Hướng dẫn Ember.JS](https://guides.emberjs.com/release/)
  - [Hướng dẫn: Super Rentals](https://guides.emberjs.com/release/tutorial/part-1/)

- [Tài liệu API Ember.JS](https://api.emberjs.com/ember/release/)
- [Máy chủ Discord Ember.JS](https://discord.com/invite/emberjs) — diễn đàn/máy chủ chat nơi bạn có thể gặp gỡ cộng đồng Ember, tìm kiếm sự giúp đỡ và giúp đỡ người khác!

## Khắc phục sự cố chung, những điểm cần lưu ý và hiểu nhầm

Đây không phải là danh sách đầy đủ, nhưng là danh sách những điều xuất hiện vào thời điểm viết (cập nhật lần cuối, tháng 5 năm 2020).

### Làm thế nào để debug những gì đang xảy ra trong framework?

Đối với những thứ _dành riêng cho framework_, có [add-on ember-inspector](https://guides.emberjs.com/release/ember-inspector/), cho phép kiểm tra:

- Tuyến đường & Controller
- Thành phần
- Dịch vụ
- Promise
- Dữ liệu (tức là từ API từ xa — từ ember-data, theo mặc định)
- Thông tin Deprecation
- Hiệu suất Render

Để debug JavaScript chung, hãy xem [hướng dẫn về JavaScript Debugging](https://firefox-source-docs.mozilla.org/devtools-user/debugger/index.html)
cũng như tương tác với [các công cụ debug khác của trình duyệt](https://firefox-source-docs.mozilla.org/devtools-user/index.html). Trong bất kỳ dự án Ember mặc định nào, sẽ có hai file JavaScript chính, `vendor.js` và `{app-name}.js`. Cả hai file này đều được tạo với sourcemap, vì vậy khi bạn mở `vendor.js` hoặc `{app-name}.js` để tìm kiếm code liên quan, khi debugger được đặt, sourcemap sẽ được tải và điểm dừng sẽ được đặt trong code trước khi biên dịch để dễ tương quan hơn với code dự án của bạn.

Để biết thêm thông tin về sourcemap, tại sao chúng cần thiết và ember-cli làm gì với chúng, hãy xem hướng dẫn [Advanced Use: Asset Compilation](https://cli.emberjs.com/release/advanced-use/asset-compilation/). Lưu ý rằng sourcemap được bật theo mặc định.

### `ember-data` được cài đặt sẵn; tôi có cần nó không?

Không hề. Trong khi `ember-data` giải quyết _các vấn đề phổ biến nhất_ mà bất kỳ ứng dụng xử lý dữ liệu nào sẽ gặp phải, có thể tự xây dựng client dữ liệu frontend của riêng bạn. Một thay thế phổ biến cho bất kỳ client dữ liệu frontend đầy đủ tính năng nào là [Fetch API](/en-US/docs/Web/API/Fetch_API/Using_Fetch).

Sử dụng các mẫu thiết kế được cung cấp bởi framework, một `Route` sử dụng `fetch()` sẽ trông như thế này:

```js
import Route from "@ember/routing/route";

export default class MyRoute extends Route {
  async model() {
    let response = await fetch("some/url/to/json/data");
    let json = await response.json();

    return {
      data: json,
    };
  }
}
```

Xem thêm thông tin về [chỉ định `model` của `Route`](https://guides.emberjs.com/release/routing/specifying-a-routes-model/) ở đây.

### Tại sao tôi không thể chỉ sử dụng JavaScript?

Đây là câu hỏi _phổ biến nhất_ mà người Ember nghe từ những người có kinh nghiệm trước với [React](/en-US/docs/Learn_web_development/Core/Frameworks_libraries/React_getting_started). Trong khi về mặt kỹ thuật có thể sử dụng JSX, hoặc bất kỳ hình thức tạo DOM nào khác, chưa có gì mạnh mẽ như hệ thống mẫu của Ember. Chủ nghĩa tối giản có chủ đích buộc phải đưa ra một số quyết định, và cho phép code nhất quán hơn, trong khi giữ mẫu mang tính cấu trúc hơn là lấp đầy chúng bằng logic tùy bỉnh.

Xem thêm: [ReactiveConf 2017: Secrets of the Glimmer VM](https://www.youtube.com/watch?v=nXCSloXZ-wc)

### Trạng thái của helper `mut` là gì?

`mut` không được đề cập trong hướng dẫn này và thực sự là hành lý từ thời điểm chuyển đổi khi Ember đang chuyển từ dữ liệu ràng buộc hai chiều sang luồng dữ liệu một chiều phổ biến hơn và dễ lý giải hơn. Nó có thể được coi là một biến đổi thời gian build bao bọc đối số của nó với hàm setter.

Cụ thể hơn, sử dụng `mut` cho phép các hàm cài đặt chỉ có mẫu được khai báo:

```hbs-nolint
<Checkbox
  @value=\{{this.someData}}
  @onToggle=\{{fn (mut this.someData) (not this.someData)}}
/>
```

Trong khi đó, không có `mut`, cần một lớp class thành phần:

```js
import Component from "@glimmer/component";
import { tracked } from "@glimmer/tracking";
import { action } from "@ember/object";

export default class Example extends Component {
  @tracked someData = false;

  @action
  setData(newValue) {
    this.someData = newValue;
  }
}
```

Sau đó sẽ được gọi trong mẫu như sau:

```hbs-nolint
<Checkbox @data=\{{this.someData}} @onChange=\{{this.setData}} />
```

Do tính ngắn gọn của việc sử dụng `mut`, có thể mong muốn sử dụng nó. Tuy nhiên, `mut` có ngữ nghĩa không tự nhiên và đã gây ra nhiều nhầm lẫn trong suốt thời gian tồn tại của nó.

Đã có một vài ý tưởng mới được tập hợp thành dạng add-on sử dụng các API công khai, [`ember-set-helper`](https://github.com/adopted-ember-addons/ember-set-helper) và [`ember-box`](https://github.com/pzuraq/ember-box). Cả hai đều cố gắng giải quyết các vấn đề của `mut`
bằng cách giới thiệu các khái niệm rõ ràng hơn / "ít ma thuật" hơn, tránh các biến đổi thời gian build và hành vi Glimmer VM ngầm định.

Với `ember-set-helper`:

```hbs
<Checkbox @value=\{{this.someData}} @onToggle=\{{set this "someData" (not
this.someData)}} />
```

Với `ember-box`:

```hbs-nolint
\{{#let (box this.someData) as |someData|}}
  <Checkbox
    @value=\{{unwrap someData}}
    @onToggle=\{{update someData (not this.someData)}}
  />
\{{/let}}
```

Lưu ý rằng không có giải pháp nào trong số này đặc biệt phổ biến trong cộng đồng, và về tổng thể, mọi người vẫn đang cố gắng tìm ra API thuận tiện và đơn giản để thiết lập dữ liệu trong ngữ cảnh chỉ có mẫu, mà không có JS backing.

### Mục đích của Controller là gì?

[Controller](https://guides.emberjs.com/release/routing/controllers/) là [Singleton](https://en.wikipedia.org/wiki/Singleton_pattern), có thể giúp quản lý ngữ cảnh render của tuyến đường đang hoạt động. Về bề ngoài, chúng hoạt động giống như JavaScript backing của thành phần. Controller là (tính đến tháng 1 năm 2020), cách duy nhất để quản lý URL Query Params.

Lý tưởng nhất, các controller nên khá nhẹ về trách nhiệm, ủy quyền cho Thành phần và Dịch vụ khi có thể.

### Mục đích của Routes là gì?

Một [Route](https://guides.emberjs.com/release/routing/defining-your-routes/) đại diện cho một phần của URL khi người dùng điều hướng từ nơi này đến nơi khác trong ứng dụng.
Một Route chỉ có một vài trách nhiệm:

- Tải _dữ liệu tối thiểu cần thiết_ để render tuyến đường (hoặc view-sub-tree).
- Kiểm soát quyền truy cập vào tuyến đường và chuyển hướng nếu cần.
- Xử lý các trạng thái tải và lỗi từ dữ liệu tối thiểu cần thiết.

Một Route chỉ có 3 hook vòng đời, tất cả đều tùy chọn:

- `beforeModel` — kiểm soát quyền truy cập vào tuyến đường.
- `model` — nơi dữ liệu được tải.
- `afterModel` — xác minh quyền truy cập.

Cuối cùng, một Route có khả năng xử lý các sự kiện phổ biến phát sinh từ cấu hình `model`:

- `loading` — phải làm gì khi hook `model` đang tải.
- `error` — phải làm gì khi xảy ra lỗi từ `model`.

Cả `loading` và `error` đều có thể render các mẫu mặc định cũng như các mẫu tùy chỉnh được định nghĩa ở nơi khác trong ứng dụng, thống nhất các trạng thái loading/error.

Thông tin thêm về [tất cả những gì Route có thể làm được tìm thấy trong tài liệu API](https://api.emberjs.com/ember/release/classes/route/).

{{PreviousMenu("Learn_web_development/Core/Frameworks_libraries/Ember_routing", "Learn_web_development/Core/Frameworks_libraries")}}

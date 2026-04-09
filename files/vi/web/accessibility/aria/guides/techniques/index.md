---
title: "Sử dụng ARIA: vai trò, trạng thái và thuộc tính"
slug: Web/Accessibility/ARIA/Guides/Techniques
page-type: guide
sidebar: accessibilitysidebar
---

ARIA định nghĩa các ngữ nghĩa có thể được áp dụng cho các phần tử. Chúng được chia thành **vai trò** (định nghĩa một loại phần tử giao diện người dùng) và **trạng thái** cùng **thuộc tính** được vai trò đó hỗ trợ. Tác giả phải gán một vai trò ARIA và các trạng thái, thuộc tính phù hợp cho phần tử trong suốt vòng đời của nó, trừ khi phần tử đó đã có sẵn ngữ nghĩa ARIA phù hợp, chẳng hạn thông qua việc dùng một phần tử HTML thích hợp. Việc bổ sung ngữ nghĩa ARIA chỉ cung cấp thêm thông tin cho accessibility API của trình duyệt và không ảnh hưởng đến DOM của trang.

## Vai trò

### Vai trò widget

- [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role)
- [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role)
- [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role)
- [`link`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role)
- [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role)
- [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role)
- [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role)
- [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role)
- [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role)
- [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role)
- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (khi có thể nhận tiêu điểm)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
- [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role)
- [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

### Vai trò tổ hợp

Các kỹ thuật dưới đây mô tả từng vai trò tổ hợp cũng như các vai trò con bắt buộc và tùy chọn của chúng.

- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role) (bao gồm các vai trò [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role), [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role), [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role))
- [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role) (bao gồm vai trò [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role))
- [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
- [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radiogroup_role) (xem [vai trò `radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role))
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role) (bao gồm các vai trò [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role) và [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role))
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

### Vai trò cấu trúc tài liệu

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role)
- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role)
- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role)
- [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role)
- [`directory`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/directory_role)
- [`document`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role)
- [`feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role)
- [`figure`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/figure_role)
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [`heading`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role)
- [`img`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role)
- [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role)
- [`listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role)
- [`math`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/math_role)
- [`none`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role)
- [`note`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/note_role)
- [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role)
- [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role)
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role)
- [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role)
- [`term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role)
- [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
- [`tooltip`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tooltip_role)

### Vai trò landmark

- [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role)
- [`complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role)
- [`contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role)
- [`form`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role)
- [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role)
- [`navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role)
- [`region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role)
- [`search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role)

### Vai trò live region

- [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [`log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [`marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [`status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [`timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)

### Vai trò cửa sổ

- [`alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)

## Trạng thái và thuộc tính

### Thuộc tính widget

- [`aria-autocomplete`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-autocomplete)
- [`aria-checked`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-checked)
- [`aria-current`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-current)
- [`aria-disabled`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-disabled)
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- [`aria-expanded`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-expanded)
- [`aria-haspopup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-haspopup)
- [`aria-hidden`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-hidden)
- [`aria-invalid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-invalid)
- [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label)
- [`aria-level`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-level)
- [`aria-modal`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-modal)
- [`aria-multiline`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiline)
- [`aria-multiselectable`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-multiselectable)
- [`aria-orientation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-orientation)
- [`aria-placeholder`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-placeholder)
- [`aria-pressed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-pressed)
- [`aria-readonly`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-readonly)
- [`aria-required`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-required)
- [`aria-selected`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-selected)
- [`aria-sort`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-sort)
- [`aria-valuemax`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemax)
- [`aria-valuemin`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuemin)
- [`aria-valuenow`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuenow)
- [`aria-valuetext`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-valuetext)

### Thuộc tính live region

- [`aria-live`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-live)
- [`aria-relevant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-relevant)
- [`aria-atomic`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-atomic)
- [`aria-busy`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-busy)

### Thuộc tính kéo và thả

- [`aria-dropeffect`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-dropeffect) {{deprecated_inline}}
- [`aria-grabbed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-grabbed) {{deprecated_inline}}

### Thuộc tính quan hệ

- [`aria-activedescendant`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-activedescendant)
- [`aria-colcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colcount)
- [`aria-colindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colindex)
- [`aria-colspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-colspan)
- [`aria-controls`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-controls)
- [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
- [`aria-details`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-details)
- [`aria-errormessage`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-errormessage)
- [`aria-flowto`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-flowto)
- [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby)
- [`aria-owns`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-owns)
- [`aria-posinset`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-posinset)
- [`aria-rowcount`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowcount)
- [`aria-rowindex`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowindex)
- [`aria-rowspan`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-rowspan)
- [`aria-setsize`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-setsize)

### Thuộc tính dành riêng cho MicrosoftEdge

- `x-ms-aria-flowfrom` {{Non-standard_Inline}}

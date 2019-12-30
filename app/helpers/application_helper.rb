module ApplicationHelper
    def link_to_remove_fields(name, f)
        f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
    end
    
    def link_to_add_fields(name, f, association, target_id, html_class)
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        link_to(name, 'JavaScript:void(0);', class: html_class, data: {add_fields: true, target_id: target_id, id: id, fields: fields.gsub("\n", "")})
    end 

    def link_to_home
        return link_to 'Back to Home', root_path
    end
end

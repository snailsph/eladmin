package ${package}.rest;

import me.zhengjie.aop.log.Log;
import ${package}.domain.${className};
import ${package}.service.${className}Service;
import ${package}.service.dto.${className}QueryCriteria;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;

/**
* @author ${author}
* @date ${date}
*/
@Api(tags = "${className}管理")
@RestController
@RequestMapping("/api/${changeClassName}")
public class ${className}Controller {

    private final ${className}Service ${changeClassName}Service;

    public ${className}Controller(${className}Service ${changeClassName}Service) {
        this.${changeClassName}Service = ${changeClassName}Service;
    }

    @GetMapping
    @Log("查询${className}")
    @ApiOperation("查询${className}")
    @PreAuthorize("hasAnyRole('admin','${upperCaseClassName}_ALL','${upperCaseClassName}_SELECT')")
    public ResponseEntity get${className}s(${className}QueryCriteria criteria, Pageable pageable){
        return new ResponseEntity<>(${changeClassName}Service.queryAll(criteria,pageable),HttpStatus.OK);
    }

    @PostMapping
    @Log("新增${className}")
    @ApiOperation("新增${className}")
    @PreAuthorize("hasAnyRole('admin','${upperCaseClassName}_ALL','${upperCaseClassName}_CREATE')")
    public ResponseEntity create(@Validated @RequestBody ${className} resources){
        return new ResponseEntity<>(${changeClassName}Service.create(resources),HttpStatus.CREATED);
    }

    @PutMapping
    @Log("修改${className}")
    @ApiOperation("修改${className}")
    @PreAuthorize("hasAnyRole('admin','${upperCaseClassName}_ALL','${upperCaseClassName}_EDIT')")
    public ResponseEntity update(@Validated @RequestBody ${className} resources){
        ${changeClassName}Service.update(resources);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }

    @DeleteMapping(value = "/{${pkChangeColName}}")
    @Log("删除${className}")
    @ApiOperation("删除${className}")
    @PreAuthorize("hasAnyRole('admin','${upperCaseClassName}_ALL','${upperCaseClassName}_DELETE')")
    public ResponseEntity delete(@PathVariable ${pkColumnType} ${pkChangeColName}){
        ${changeClassName}Service.delete(${pkChangeColName});
        return new ResponseEntity(HttpStatus.OK);
    }
}
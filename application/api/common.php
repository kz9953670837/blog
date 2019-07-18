<?php
function arrayToXml($data, $level = 1)
{
	$str = $level == 1 ? '<xml>' : '';
	$pl = '';
	for ($i=0; $i < $level; $i++) { 
		$pl .= "    ";
	}
	foreach ($data as $k => $v) {
		$k = is_numeric($k) ? 'item' : $k;
		if (is_array($v)) {
			$str .= "\r".$pl.'<'.$k.'>'.arrayToXml($v, $level+1)."\r".$pl."</".$k.'>';
		} else {
			$str .= "\r".$pl.'<'.$k.'>'.(!is_numeric($v) ? '<![CDATA[' : '').$v.(!is_numeric($v) ? ']]>' : '').'</'.$k.'>';
		}
	}
	return $str.($level == 1 ? "\r</xml>" : '');
}

function return_param_tr($data, $pid = 0, $level = 0)
{
	$str = '';
	$pl = '';
	for ($i=0; $i < $level; $i++) { 
		$pl .= "&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	foreach ($data as $k => $v) {
		$isParent = false;
		if (isset($v['childs']) && count($v['childs']) > 0) {
			$isParent = true;
		}
		$str .= "<tr class='childs-level{$pid}' style='".($level ? 'display:none' : '')."'>";
			$str .= "<td>{$pl}<span data-id='{$v['id']}' class='".($isParent ? 'childs childs-close' : '')."'>{$v['name']}</span></td>";
			$str .= "<td>{$v['data_type']}</td>";
			$str .= "<td>{$v['value']}</td>";
			$str .= "<td>{$v['desc']}</td>";
		$str .= '</tr>';
		if ($isParent) {
			$str .= return_param_tr($v['childs'], $v['id'], $level+1);
		}
	}

	return $str;
}

function request_param_tr($data, $pid = 0, $level = 0)
{
	$str = '';
	$pl = '';
	for ($i=0; $i < $level; $i++) { 
		$pl .= "&nbsp;&nbsp;&nbsp;&nbsp;";
	}
	foreach ($data as $k => $v) {
		$isParent = false;
		if (isset($v['childs']) && count($v['childs']) > 0) {
			$isParent = true;
		}
		$str .= "<tr class='childs-level{$pid}' style='".($level ? 'display:none' : '')."'>";
			$str .= "<td>{$pl}<span data-id='{$v['id']}' class='".($isParent ? 'childs childs-close' : '')."'>{$v['name']}</span></td>";
			$str .= "<td>{$v['data_type']}</td>";
			$str .= "<td>".($v['is_must'] ? '是' : '否')."</td>";
			$str .= "<td>{$v['value']}</td>";
			$str .= "<td>{$v['desc']}</td>";
		$str .= '</tr>';
		if ($isParent) {
			$str .= request_param_tr($v['childs'], $v['id'], $level+1);
		}
	}

	return $str;
}

function request_param_form($data, $pre = '')
{
	$str = '';
	foreach ($data as $k => $v) {
		$name = $pre ? $pre.'['.$v['name'].']' : $v['name'];
		if (isset($v['childs'])) {
			// $title = $title ? $title.'['.$v['name'].']' : $v['name'];
			$str .= '<div class="layui-form-item sandbox-item"><label class="layui-form-label">'.$v['name'].'：</label><div class="layui-form-mid layui-word-aux">'.$v['desc'].'</div></div>';
			$str .= request_param_form($v['childs'], $name.'['.$k.']');
		} else {
			$str .= '<div class="layui-form-item sandbox-item">';
			// $str .= '<label class="layui-form-label">'. ($title ? $title.'['.$v['name'].']' : $v['name']) .'：</label>';
			$str .= '<label class="layui-form-label">'. $name.'：</label>';
			$str .= '<div class="layui-input-inline"><input type="text" class="layui-input" name="'.$name.'" autocomplete="off" placeholder="'.($v['is_must'] ? '必填' : '选填').'" value="'.$v['value'].'"></div>';
			$str .= '<div class="layui-form-mid layui-word-aux">'.$v['desc'].'</div></div>';
		}
	}
	return $str;
}
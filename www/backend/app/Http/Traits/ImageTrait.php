<?php

namespace App\Http\Traits;
use Illuminate\Http\Request;

trait ImageTrait {

    /**
     * @param Request $request
     * @return $this|false|string
     */
    public function verifyAndUpload(Request $request, $fieldname = 'image', $directory = 'images') {
        //dd($request,$fieldname,$directory);

        ini_set('memory_limit', '1500M');

        $filename="";
        if( $request->hasFile( $fieldname )) {
  
            if (!$request->file($fieldname)->isValid()) {
  
                return redirect()->back()->withInput();
  
            }else{
                //$qfile = $request->file($fieldname);
                //$qname = rand().'-'.$qfile->getClientOriginalName();

                $qfile = $request->file($fieldname);
                $qname = $qfile->hashName(); // Generate a unique, random name...
                //$extension = $qfile->extension(); // Determine the file's extension based on the file's MIME type...
                //dd($qfile,$qname);
                $image['filePath'] = $qname;
                $qfile->move(public_path($directory.'/'), $qname);
                $filename = $directory.'/'.$qname;
            }
            
            return $filename;
  
        }
  
        return null;
  
    }    

    public function multipleImages(Request $request, $fieldname = 'image', $directory = 'images') {
        //dd($request,$fieldname,$directory);
        ini_set('memory_limit', '1500M');
        $filename="";
        if( $request->hasFile( $fieldname )) {

                foreach($request->file($fieldname) as $file)
                {   
                    //$qname =  rand().'-'.$file->getClientOriginalName();
                    $qname = $file->hashName();
                    $file->move(public_path($directory.'/'), $qname);
                    $filename=$directory.'/'.$qname;
                    $data[] = $filename; 
                }
                
            
            return $data;
  
        }
  
        return null;
  
    }

}
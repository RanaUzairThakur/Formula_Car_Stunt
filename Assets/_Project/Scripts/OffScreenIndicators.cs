using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class OffScreenIndicators : MonoBehaviour
{
    public Texture targetArrow;
    public Image rotater;
    //Start is called before the first frame update
 

    public void hide()
    {
        rotater.transform.parent.gameObject.SetActive(false);

    }
}
